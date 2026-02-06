<?php
require_once 'templates/header.php';

// Initialize cart if not exists
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

// Handle remove item request
if (isset($_GET['remove'])) {
    $remove_id = (int)$_GET['remove'];
    if (isset($_SESSION['cart'][$remove_id])) {
        unset($_SESSION['cart'][$remove_id]);
    }
    header("Location: /lushaka-urithi/cart.php");
    exit();
}

// Handle quantity update
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_cart'])) {
    foreach ($_POST['quantity'] as $product_id => $quantity) {
        $product_id = (int)$product_id;
        $quantity = (int)$quantity;
        
        if ($quantity <= 0) {
            unset($_SESSION['cart'][$product_id]);
        } else {
            $_SESSION['cart'][$product_id]['quantity'] = $quantity;
        }
    }
    header("Location: /lushaka-urithi/cart.php");
    exit();
}

// Calculate totals
$subtotal = 0;
$cart_items = [];

if (!empty($_SESSION['cart'])) {
    $product_ids = array_keys($_SESSION['cart']);
    $placeholders = implode(',', array_fill(0, count($product_ids), '?'));
    
    $stmt = $pdo->prepare("SELECT product_id, name, price, quantity as stock_quantity, images 
                           FROM products 
                           WHERE product_id IN ($placeholders) AND status = 'active'");
    $stmt->execute($product_ids);
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    foreach ($products as $product) {
        $cart_item = $_SESSION['cart'][$product['product_id']];
        $images = explode(',', $product['images']);
        $main_image = $images[0];
        
        $item_total = $product['price'] * $cart_item['quantity'];
        $subtotal += $item_total;
        
        $cart_items[] = [
            'product_id' => $product['product_id'],
            'name' => $product['name'],
            'price' => $product['price'],
            'quantity' => $cart_item['quantity'],
            'image' => $main_image,
            'stock_quantity' => $product['stock_quantity'],
            'item_total' => $item_total
        ];
    }
}

// Calculate estimated shipping (simplified)
$shipping = $subtotal > 500 ? 0 : 50; // Free shipping for orders over R500
$total = $subtotal + $shipping;
?>

<section class="shopping-cart">
    <h2>Your Shopping Cart</h2>
    
    <?php if (empty($cart_items)): ?>
        <div class="empty-cart">
            <p>Your cart is empty.</p>
            <a href="/lushaka-urithi/products.php" class="btn">Continue Shopping</a>
        </div>
    <?php else: ?>
        <form action="/lushaka-urithi/cart.php" method="post">
            <div class="cart-items">
                <table>
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($cart_items as $item): ?>
                            <tr>
                                <td class="product-info">
                                    <img src="/lushaka-urithi/assets/uploads/products/<?= $item['image'] ?>" alt="<?= $item['name'] ?>">
                                    <div>
                                        <h4><?= $item['name'] ?></h4>
                                    </div>
                                </td>
                                <td class="price">R <?= number_format($item['price'], 2) ?></td>
                                <td class="quantity">
                                    <input type="number" name="quantity[<?= $item['product_id'] ?>]" 
                                           value="<?= $item['quantity'] ?>" min="1" max="<?= $item['stock_quantity'] ?>">
                                </td>
                                <td class="total">R <?= number_format($item['item_total'], 2) ?></td>
                                <td class="action">
                                    <a href="/lushaka-urithi/cart.php?remove=<?= $item['product_id'] ?>" class="remove-item">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            
            <div class="cart-actions">
                <a href="/lushaka-urithi/products.php" class="btn btn-continue">Continue Shopping</a>
                <button type="submit" name="update_cart" class="btn btn-update">Update Cart</button>
            </div>
            
            <div class="cart-summary">
                <div class="summary-card">
                    <h3>Order Summary</h3>
                    <div class="summary-row">
                        <span>Subtotal:</span>
                        <span>R <?= number_format($subtotal, 2) ?></span>
                    </div>
                    <div class="summary-row">
                        <span>Shipping:</span>
                        <span>R <?= number_format($shipping, 2) ?></span>
                    </div>
                    <div class="summary-row total">
                        <span>Total:</span>
                        <span>R <?= number_format($total, 2) ?></span>
                    </div>
                    <a href="/lushaka-urithi/checkout.php" class="btn btn-checkout">Proceed to Checkout</a>
                </div>
            </div>
        </form>
    <?php endif; ?>
</section>

<?php require_once 'templates/footer.php'; ?>