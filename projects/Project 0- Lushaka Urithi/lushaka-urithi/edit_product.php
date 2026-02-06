<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit();
}

$id = $_GET['id'] ?? null;
if (!$id) exit("Invalid product ID.");

// When form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['product_name'];
    $category = $_POST['product_category'];
    $price = $_POST['product_price'];
    $description = $_POST['product_description'];

    $sql = "UPDATE products SET product_name = ?, product_category = ?, product_price = ?, product_description = ? WHERE id = ? AND seller_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssdsii", $name, $category, $price, $description, $id, $_SESSION['user_id']);
    $stmt->execute();
    header("Location: seller.php");
    exit();
}

// Fetch product details for the form
$stmt = $conn->prepare("SELECT * FROM products WHERE id = ? AND seller_id = ?");
$stmt->bind_param("ii", $id, $_SESSION['user_id']);
$stmt->execute();
$product = $stmt->get_result()->fetch_assoc();
if (!$product) exit("Product not found or unauthorized.");
?>

<h2>Edit Product</h2>
<form method="post">
    <input name="product_name" value="<?= htmlspecialchars($product['product_name']) ?>" required><br>
    <input name="product_category" value="<?= htmlspecialchars($product['product_category']) ?>" required><br>
    <input name="product_price" type="number" step="0.01" value="<?= $product['product_price'] ?>" required><br>
    <textarea name="product_description"><?= htmlspecialchars($product['product_description']) ?></textarea><br>
    <button type="submit">Update Product</button>
</form>
