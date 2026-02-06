<?php
require_once('../templates/header.php');


// Redirect if not a seller
if ($userType !== 'seller') {
    header("Location: /lushaka-urithi/");
    exit();
}

if (!isset($_GET['id'])) {
    header("Location: /lushaka-urithi/seller/dashboard.php?tab=orders");
    exit();
}

$order_id = (int)$_GET['id'];

// Fetch order details
$stmt = $pdo->prepare("SELECT o.*, u.username as buyer_name, u.email as buyer_email 
                      FROM orders o 
                      JOIN users u ON o.buyer_id = u.user_id 
                      WHERE o.order_id = ?");
$stmt->execute([$order_id]);
$order = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$order) {
    header("Location: /lushaka-urithi/seller/dashboard.php?tab=orders");
    exit();
}

// Fetch order items from this seller
$stmt = $pdo->prepare("SELECT oi.*, p.name as product_name, p.images 
                      FROM order_items oi 
                      JOIN products p ON oi.product_id = p.product_id 
                      WHERE oi.order_id = ? AND p.seller_id = ?");
$stmt->execute([$order_id, $_SESSION['user_id']]);
$order_items = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (empty($order_items)) {
    header("Location: /lushaka-urithi/seller/dashboard.php?tab=orders");
    exit();
}

// Calculate seller's total from this order
$seller_total = 0;
foreach ($order_items as $item) {
    $seller_total += $item['price'] * $item['quantity'];
}

// Handle status update
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_status'])) {
    $new_status = $_POST['status'];
    $tracking_number = $_POST['tracking_number'] ?? null;
    
    // Validate status transition
    $valid_transitions = [
        'pending' => ['processing', 'cancelled'],
        'processing' => ['shipped', 'cancelled'],
        'shipped' => ['delivered'],
    ];
    
    if (isset($valid_transitions[$order['status']]) && in_array($new_status, $valid_transitions[$order['status']])) {
        // Update status
        $stmt = $pdo->prepare("UPDATE orders SET status = ?, tracking_number = ? WHERE order_id = ?");
        $stmt->execute([$new_status, $tracking_number, $order_id]);
        
        // Send notification to buyer
        $subject = "Order #" . str_pad($order_id, 6, '0', STR_PAD_LEFT) . " status updated";
        $message = "Your order status has been updated to: " . ucfirst($new_status);
        if ($tracking_number) {
            $message .= "\n\nTracking number: " . $tracking_number;
        }
        
        $stmt = $pdo->prepare("INSERT INTO messages (sender_id, receiver_id, subject, message) 
                              VALUES (?, ?, ?, ?)");
        $stmt->execute([$_SESSION['user_id'], $order['buyer_id'], $subject, $message]);
        
        header("Location: /lushaka-urithi/seller/order_details.php?id=$order_id&updated=1");
        exit();
    }
}
?>

<section class="seller-order-details">
    <div class="container">
        <div class="order-header">
            <a href="/lushaka-urithi/seller/dashboard.php?tab=orders" class="btn-back">
                <i class="fas fa-arrow-left"></i> Back to Orders
            </a>
            <h1>Order #<?= str_pad($order_id, 6, '0', STR_PAD_LEFT) ?></h1>
            <p class="order-date">Placed on <?= date('F j, Y', strtotime($order['order_date'])) ?></p>
            
            <div class="order-status">
                <span class="status-badge <?= $order['status'] ?>"><?= ucfirst($order['status']) ?></span>
                <?php if ($order['tracking_number']): ?>
                    <p>Tracking #: <?= $order['tracking_number'] ?></p>
                <?php endif; ?>
            </div>
        </div>
        
        <?php if (isset($_GET['updated'])): ?>
            <div class="alert alert-success">
                Order status updated successfully!
            </div>
        <?php endif; ?>
        
        <div class="order-details-grid">
            <div class="order-items">
                <h2>Order Items</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($order_items as $item): 
                            $images = explode(',', $item['images']);
                            $main_image = $images[0];
                        ?>
                            <tr>
                                <td class="product-info">
                                    <img src="/lushaka-urithi/assets/uploads/products/<?= $main_image ?>" alt="<?= $item['product_name'] ?>" width="60">
                                    <div>
                                        <h4><?= $item['product_name'] ?></h4>
                                    </div>
                                </td>
                                <td>R <?= number_format($item['price'], 2) ?></td>
                                <td><?= $item['quantity'] ?></td>
                                <td>R <?= number_format($item['price'] * $item['quantity'], 2) ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" class="text-right">Subtotal:</td>
                            <td>R <?= number_format($seller_total, 2) ?></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="text-right">Shipping:</td>
                            <td>R <?= number_format(0, 2) ?></td> <!-- Seller doesn't pay shipping -->
                        </tr>
                        <tr class="total-row">
                            <td colspan="3" class="text-right">Total:</td>
                            <td>R <?= number_format($seller_total, 2) ?></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            
            <div class="order-info">
                <div class="info-card">
                    <h3>Customer Information</h3>
                    <p><strong>Name:</strong> <?= $order['buyer_name'] ?></p>
                    <p><strong>Email:</strong> <?= $order['buyer_email'] ?></p>
                </div>
                
                <div class="info-card">
                    <h3>Shipping Address</h3>
                    <p><?= nl2br($order['shipping_address']) ?></p>
                </div>
                
                <div class="info-card">
                    <h3>Payment Method</h3>
                    <p><?= $order['payment_method'] ?></p>
                </div>
                
                <?php if ($order['status'] !== 'delivered' && $order['status'] !== 'cancelled'): ?>
                    <div class="info-card status-update">
                        <h3>Update Order Status</h3>
                        <form action="/lushaka-urithi/seller/order_details.php?id=<?= $order_id ?>" method="post">
                            <div class="form-group">
                                <label for="status">New Status:</label>
                                <select id="status" name="status" required>
                                    <?php if ($order['status'] === 'pending'): ?>
                                        <option value="processing">Processing</option>
                                        <option value="cancelled">Cancel Order</option>
                                    <?php elseif ($order['status'] === 'processing'): ?>
                                        <option value="shipped">Shipped</option>
                                        <option value="cancelled">Cancel Order</option>
                                    <?php elseif ($order['status'] === 'shipped'): ?>
                                        <option value="delivered">Delivered</option>
                                    <?php endif; ?>
                                </select>
                            </div>
                            
                            <div class="form-group" id="tracking-number-group" style="display: none;">
                                <label for="tracking_number">Tracking Number:</label>
                                <input type="text" id="tracking_number" name="tracking_number">
                            </div>
                            
                            <button type="submit" name="update_status" class="btn btn-primary">Update Status</button>
                        </form>
                    </div>
                <?php endif; ?>
            </div>
        </div>
        
        <div class="order-actions">
            <a href="/lushaka-urithi/seller/message.php?buyer_id=<?= $order['buyer_id'] ?>&order_id=<?= $order_id ?>" class="btn btn-secondary">
                <i class="fas fa-envelope"></i> Message Buyer
            </a>
        </div>
    </div>
</section>

<script>
// Show/hide tracking number field based on status selection
document.getElementById('status').addEventListener('change', function() {
    const trackingGroup = document.getElementById('tracking-number-group');
    if (this.value === 'shipped') {
        trackingGroup.style.display = 'block';
    } else {
        trackingGroup.style.display = 'none';
    }
});
</script>

<?php require_once('../templates/header.php'); ?>