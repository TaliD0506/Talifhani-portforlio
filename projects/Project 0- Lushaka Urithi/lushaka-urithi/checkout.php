<?php
require_once 'templates/header.php';

// Redirect if not logged in
if (!$isLoggedIn) {
    $_SESSION['redirect_url'] = '/lushaka-urithi/checkout.php';
    header("Location: /lushaka-urithi/login.php");
    exit();
}

// Redirect if cart is empty
if (empty($_SESSION['cart'])) {
    header("Location: /lushaka-urithi/cart.php");
    exit();
}

// Fetch user details
$stmt = $pdo->prepare("SELECT * FROM users WHERE user_id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Calculate cart totals
$subtotal = 0;
$cart_items = [];

$product_ids = array_keys($_SESSION['cart']);
$placeholders = implode(',', array_fill(0, count($product_ids), '?'));
    
$stmt = $pdo->prepare("SELECT product_id, name, price, quantity as stock_quantity 
                       FROM products 
                       WHERE product_id IN ($placeholders) AND status = 'active'");
$stmt->execute($product_ids);
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
foreach ($products as $product) {
    $cart_item = $_SESSION['cart'][$product['product_id']];
    $item_total = $product['price'] * $cart_item['quantity'];
    $subtotal += $item_total;
    
    $cart_items[] = [
        'product_id' => $product['product_id'],
        'name' => $product['name'],
        'price' => $product['price'],
        'quantity' => $cart_item['quantity'],
        'stock_quantity' => $product['stock_quantity'],
        'item_total' => $item_total
    ];
}

$shipping = $subtotal > 500 ? 0 : 50; // Free shipping for orders over R500
$total = $subtotal + $shipping;

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validate form data
    $shipping_address = trim($_POST['shipping_address']);
    $payment_method = trim($_POST['payment_method']);
    
    if (empty($shipping_address)) {
        $error = "Please enter a shipping address.";
    } elseif (empty($payment_method)) {
        $error = "Please select a payment method.";
    } else {
        // Create order
        try {
            $pdo->beginTransaction();
            
            // Insert order
            $stmt = $pdo->prepare("INSERT INTO orders (buyer_id, total_amount, payment_method, shipping_address) 
                                  VALUES (?, ?, ?, ?)");
            $stmt->execute([$_SESSION['user_id'], $total, $payment_method, $shipping_address]);
            $order_id = $pdo->lastInsertId();
            
            // Insert order items and update product quantities
            foreach ($cart_items as $item) {
                // Insert order item
                $stmt = $pdo->prepare("INSERT INTO order_items (order_id, product_id, quantity, price) 
                                      VALUES (?, ?, ?, ?)");
                $stmt->execute([$order_id, $item['product_id'], $item['quantity'], $item['price']]);
                
                // Update product quantity
                $new_quantity = $item['stock_quantity'] - $item['quantity'];
                $stmt = $pdo->prepare("UPDATE products SET quantity = ? WHERE product_id = ?");
                $stmt->execute([$new_quantity, $item['product_id']]);
            }
            
            $pdo->commit();
            
            // Clear cart
            unset($_SESSION['cart']);
            
            // Redirect to order confirmation
            header("Location: /lushaka-urithi/order_confirmation.php?id=$order_id");
            exit();
        } catch (Exception $e) {
            $pdo->rollBack();
            $error = "An error occurred while processing your order. Please try again.";
        }
    }
}
?>

<section class="checkout">
    <h2>Checkout</h2>
    
    <?php if (isset($error)): ?>
        <div class="alert alert-danger"><?= $error ?></div>
    <?php endif; ?>
    
    <div class="checkout-container">
        <div class="checkout-form">
            <form action="/lushaka-urithi/checkout.php" method="post">
                <div class="form-section">
                    <h3>Shipping Information</h3>
                    <div class="form-group">
                        <label for="full_name">Full Name:</label>
                        <input type="text" id="full_name" name="full_name" value="<?= htmlspecialchars($user['full_name']) ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="shipping_address">Shipping Address:</label>
                        <textarea id="shipping_address" name="shipping_address" rows="4" required><?= 
                            isset($_POST['shipping_address']) ? 
                            htmlspecialchars($_POST['shipping_address']) : 
                            htmlspecialchars($user['address'] . "\n" . $user['city'] . ", " . $user['province'] . "\n" . $user['postal_code'])
                        ?></textarea>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number:</label>
                        <input type="tel" id="phone" name="phone" value="<?= htmlspecialchars($user['phone']) ?>" required>
                    </div>
                </div>
                
                <div class="form-section">
                    <h3>Payment Method</h3>
                    <div class="payment-options">
                        <div class="payment-option">
                            <input type="radio" id="pay_cod" name="payment_method" value="Cash on Delivery" checked>
                            <label for="pay_cod">
                                <i class="fas fa-money-bill-wave"></i>
                                <span>Cash on Delivery</span>
                            </label>
                        </div>
                        <div class="payment-option">
                            <input type="radio" id="pay_bank" name="payment_method" value="Bank Transfer">
                            <label for="pay_bank">
                                <i class="fas fa-university"></i>
                                <span>Bank Transfer</span>
                            </label>
                        </div>
                        <div class="payment-option">
                            <input type="radio" id="pay_card" name="payment_method" value="Credit/Debit Card" disabled>
                            <label for="pay_card">
                                <i class="fas fa-credit-card"></i>
                                <span>Credit/Debit Card (Coming Soon)</span>
                            </label>
                        </div>
                    </div>
                </div>
                
                <div class="form-section">
                    <h3>Order Review</h3>
                    <div class="order-review">
                        <?php foreach ($cart_items as $item): ?>
                            <div class="order-item">
                                <div class="item-info">
                                    <span class="item-name"><?= $item['name'] ?></span>
                                    <span class="item-quantity">x<?= $item['quantity'] ?></span>
                                </div>
                                <span class="item-price">R <?= number_format($item['item_total'], 2) ?></span>
                            </div>
                        <?php endforeach; ?>
                        
                        <div class="order-total">
                            <div class="total-row">
                                <span>Subtotal:</span>
                                <span>R <?= number_format($subtotal, 2) ?></span>
                            </div>
                            <div class="total-row">
                                <span>Shipping:</span>
                                <span>R <?= number_format($shipping, 2) ?></span>
                            </div>
                            <div class="total-row grand-total">
                                <span>Total:</span>
                                <span>R <?= number_format($total, 2) ?></span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary btn-place-order">Place Order</button>
            </form>
        </div>
    </div>
</section>

<?php require_once 'templates/footer.php'; ?>