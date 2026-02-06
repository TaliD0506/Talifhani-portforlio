<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'buyer') {
    header("Location: ../login.php");
    exit();
}

$buyer_id = $_SESSION['user_id'];
$product_id = $_POST['product_id'];
$seller_id = $_POST['seller_id'];

$stmt = $conn->prepare("INSERT INTO orders (buyer_id, product_id, seller_id) VALUES (?, ?, ?)");
$stmt->bind_param("iii", $buyer_id, $product_id, $seller_id);
$stmt->execute();

header("Location: buyer.php?order=success");
exit();
?>
