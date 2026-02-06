<?php
session_start();

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'buyer') {
    header("Location: ../login.php");
    exit();
}

$product_id = $_POST['product_id'] ?? null;

if (!$product_id) {
    header("Location: buyer.php");
    exit();
}

// Initialize cart array if not set
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

// Prevent duplicate adds
if (!in_array($product_id, $_SESSION['cart'])) {
    $_SESSION['cart'][] = $product_id;
}

header("Location: cart.php");
exit();
