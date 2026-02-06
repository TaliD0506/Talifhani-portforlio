<?php
session_start();

// Redirect if not a seller
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit();
}

require_once '../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $seller_id = $_SESSION['user_id'];
    $product_name = $_POST['product_name'];
    $product_category = $_POST['product_category'];
    $product_price = $_POST['product_price'];
    $product_description = $_POST['product_description'];

    // Image upload
    $target_dir = "../uploads/";
    $image_name = basename($_FILES["product_image"]["name"]);
    $target_file = $target_dir . $image_name;

    if (move_uploaded_file($_FILES["product_image"]["tmp_name"], $target_file)) {
        $stmt = $conn->prepare("INSERT INTO products (seller_id, product_name, product_category, product_price, product_description, product_image) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("issdss", $seller_id, $product_name, $product_category, $product_price, $product_description, $image_name);

        if ($stmt->execute()) {
            echo "<p>✅ Product uploaded successfully!</p>";
        } else {
            echo "<p>❌ Error saving product.</p>";
        }
    } else {
        echo "<p>❌ Failed to upload image.</p>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Upload Product</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <h2>Upload New Product</h2>
    <form method="POST" enctype="multipart/form-data">
        <input type="text" name="product_name" placeholder="Product Name" required><br>
        <input type="text" name="product_category" placeholder="Product Category" required><br>
        <input type="number" name="product_price" placeholder="Price in Rands" step="0.01" required><br>
        <textarea name="product_description" placeholder="Product Description" required></textarea><br>
        <input type="file" name="product_image" required><br><br>
        <button type="submit">Upload Product</button>
    </form>

    <p><a href="seller.php">← Back to Dashboard</a></p>
</body>
</html>
