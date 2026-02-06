<?php
session_start();
require_once __DIR__ . '/../db_connect.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: /lushaka-urithi/login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['product_id'])) {
    $product_id = (int)$_POST['product_id'];
    $user_id = $_SESSION['user_id'];
    
    // Check if product exists and is active
    $stmt = $pdo->prepare("SELECT product_id FROM products WHERE product_id = ? AND status = 'active'");
    $stmt->execute([$product_id]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$product) {
        echo json_encode(['success' => false, 'message' => 'Product not available.']);
        exit();
    }
    
    // Check if already in wishlist
    $stmt = $pdo->prepare("SELECT favorite_id FROM favorites WHERE user_id = ? AND product_id = ?");
    $stmt->execute([$user_id, $product_id]);
    
    if ($stmt->rowCount() > 0) {
        echo json_encode(['success' => false, 'message' => 'Product already in your wishlist.']);
        exit();
    }
    
    // Add to wishlist
    $stmt = $pdo->prepare("INSERT INTO favorites (user_id, product_id) VALUES (?, ?)");
    $stmt->execute([$user_id, $product_id]);
    
    echo json_encode(['success' => true]);
    exit();
} else {
    header("Location: /lushaka-urithi/");
    exit();
}
?>