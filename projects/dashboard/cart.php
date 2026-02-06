<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'buyer') {
    header("Location: ../login.php");
    exit();
}

$cart = $_SESSION['cart'] ?? [];
$total = 0;
$products = [];

if (!empty($cart)) {
    $placeholders = implode(',', array_fill(0, count($cart), '?'));
    $types = str_repeat('i', count($cart));
    
    $stmt = $conn->prepare("SELECT * FROM products WHERE id IN ($placeholders)");
    $stmt->bind_param($types, ...$cart);
    $stmt->execute();
    $products = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
</head>
<body>
    <h2>Your Shopping Cart 🛍️</h2>
    <p><a href="buyer.php">🔙 Back to Products</a> | <a href="../logout.php">Logout</a></p>

    <?php if (empty($products)) : ?>
        <p>Your cart is empty.</p>
    <?php else: ?>
        <table border="1" cellpadding="10">
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <?php foreach ($products as $product): ?>
                <?php $total += $product['product_price']; ?>
                <tr>
                    <td><?= htmlspecialchars($product['product_name']) ?></td>
                    <td>R<?= number_format($product['product_price'], 2) ?></td>
                    <td>
                        <a href="remove_from_cart.php?id=<?= $product['id'] ?>">❌ Remove</a>
                    </td>
                </tr>
            <?php endforeach; ?>
            <tr>
                <td><strong>Total</strong></td>
                <td colspan="2">R<?= number_format($total, 2) ?></td>
            </tr>
        </table>
        <br>
        <form method="post" action="checkout.php">
            <button type="submit">🧾 Proceed to Checkout</button>
        </form>
    <?php endif; ?>
</body>
</html>
