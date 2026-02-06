<?php
require_once 'templates/header.php';

if (!isset($_GET['id'])) {
    header("Location: /lushaka-urithi/");
    exit();
}

$order_id = (int)$_GET['id'];

// Fetch order details
$stmt = $pdo->prepare("SELECT o.*, u.username, u.email, u.phone 
                       FROM orders o 
                       JOIN users u ON o.buyer_id = u.user_id 
                       WHERE o.order_id = ? AND o.buyer_id = ?");
$stmt->execute([$order_id, $_SESSION['user_id']]);
$order = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$order) {
    header("Location: /lushaka-urithi/");
    exit();
}

// Fetch order items
$stmt = $pdo->prepare("SELECT oi.*, p.name, p.seller_id, u.username as seller_name 
                       FROM order_items oi 
                       JOIN products p ON oi.product_id = p.product_id 
                       JOIN users u ON p.seller_id = u.user_id 
                       WHERE oi.order_id = ?");
$stmt->execute([$order_id]);
$order_items = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<section class="order-confirmation">
    <div class="confirmation-header">
        <div class="confirmation-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <h1>Thank You for Your Order!</h1>
        <p>Your order has been placed successfully. Here are your order details:</p>
        <div class="order-summary">
            <div class="summary-item">
                <span>Order Number:</span>
                <strong>#<?= str_pad($order['order_id'], 6, '0', STR_PAD_LEFT) ?></strong>
            </div>
            <div class="summary-item">
                <span>Date:</span>
                <strong><?= date('F j, Y', strtotime($order['order_date'])) ?></strong>
            </div>
            <div class="summary-item">
                <span>Total:</span>
                <strong>R <?= number_format($order['total_amount'], 2) ?></strong>
            </div>
            <div class="summary-item">
                <span>Payment Method:</span>
                <strong><?= $order['payment_method'] ?></strong>
            </div>
        </div>
    </div>
    
    <div class="order-details">
        <div class="details-section">
            <h3>Order Items</h3>
            <div class="order-items">
                <?php foreach ($order_items as $item): ?>
                    <div class="order-item">
                        <div class="item-info">
                            <h4><?= $item['name'] ?></h4>
                            <p>Sold by: <?= $item['seller_name'] ?></p>
                        </div>
                        <div class="item-quantity">
                            <span><?= $item['quantity'] ?> x R <?= number_format($item['price'], 2) ?></span>
                        </div>
                        <div class="item-total">
                            <span>R <?= number_format($item['quantity'] * $item['price'], 2) ?></span>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        
        <div class="details-section">
            <h3>Shipping Information</h3>
            <div class="shipping-info">
                <p><?= nl2br(htmlspecialchars($order['shipping_address'])) ?></p>
            </div>
        </div>
        
        <div class="details-section">
            <h3>What's Next?</h3>
            <div class="next-steps">
                <div class="step">
                    <div class="step-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="step-content">
                        <h4>Order Confirmation</h4>
                        <p>We've sent a confirmation email to <?= $order['email'] ?> with your order details.</p>
                    </div>
                </div>
                
                <?php if ($order['payment_method'] === 'Bank Transfer'): ?>
                    <div class="step">
                        <div class="step-icon">
                            <i class="fas fa-university"></i>
                        </div>
                        <div class="step-content">
                            <h4>Payment Instructions</h4>
                            <p>Please make a payment to our bank account within 24 hours to process your order:</p>
                            <p><strong>Bank:</strong> FNB<br>
                            <strong>Account Name:</strong> LushakaUrithi<br>
                            <strong>Account Number:</strong> 63019670404<br>
                            <strong>Branch Code:</strong> 051001<br>
                            <strong>Reference:</strong> ORDER#<?= str_pad($order['order_id'], 6, '0', STR_PAD_LEFT) ?></p>
                        </div>
                    </div>
                <?php endif; ?>
                
                <div class="step">
                    <div class="step-icon">
                        <i class="fas fa-truck"></i>
                    </div>
                    <div class="step-content">
                        <h4>Shipping Updates</h4>
                        <p>You'll receive updates about your order via email and SMS to <?= $order['phone'] ?>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="confirmation-actions">
        <a href="/lushaka-urithi/" class="btn btn-primary">Continue Shopping</a>
        <a href="/lushaka-urithi/account.php?tab=orders" class="btn btn-secondary">View Your Orders</a>
    </div>
</section>

<?php require_once 'templates/footer.php'; ?>