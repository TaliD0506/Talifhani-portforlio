<?php
session_start();
require_once __DIR__ . '/../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['product_id'])) {
    $product_id = (int)$_POST['product_id'];
    $quantity = isset($_POST['quantity']) ? (int)$_POST['quantity'] : 1;
    
    // Check if product exists and is available
    $stmt = $pdo->prepare("SELECT product_id, price, quantity FROM products WHERE product_id = ? AND status = 'active'");
    $stmt->execute([$product_id]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$product) {
        $_SESSION['error'] = "Product not available.";
        header("Location: /lushaka-urithi/products.php");
        exit();
    }
    
    // Check stock
    if ($quantity > $product['quantity']) {
        $_SESSION['error'] = "Requested quantity not available.";
        header("Location: /lushaka-urithi/product.php?id=$product_id");
        exit();
    }
    
    // Initialize cart if not exists
    if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = [];
    }
    
    // Add or update item in cart
    if (isset($_SESSION['cart'][$product_id])) {
        $_SESSION['cart'][$product_id]['quantity'] += $quantity;
    } else {
        $_SESSION['cart'][$product_id] = [
            'quantity' => $quantity,
            'price' => $product['price']
        ];
    }
    
    $_SESSION['success'] = "Product added to cart!";
    header("Location: /lushaka-urithi/product.php?id=$product_id");
    exit();
} else {
    header("Location: /lushaka-urithi/products.php");
    exit();
}
?>