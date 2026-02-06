<?php
session_start();
require_once("../includes/db_connect.php");

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit;
}

$seller_id = $_SESSION['user_id'];
$name = $_POST['product_name'];
$desc = $_POST['description'];
$cat = $_POST['category'];

// Handle image upload
$img_name = $_FILES['product_image']['name'];
$tmp_name = $_FILES['product_image']['tmp_name'];
$img_path = "../uploads/" . basename($img_name);

// Make sure 'uploads/' folder exists
if (!is_dir("../uploads")) {
    mkdir("../uploads");
}

move_uploaded_file($tmp_name, $img_path);

// Save to DB
$stmt = $conn->prepare("INSERT INTO products (seller_id, name, description, category, image_path) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("issss", $seller_id, $name, $desc, $cat, $img_path);

if ($stmt->execute()) {
    echo "Product uploaded successfully!";
} else {
    echo "Error: " . $stmt->error;
}
?>
