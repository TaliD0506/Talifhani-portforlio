<?php
session_start();
if (!isset($_SESSION['admin_id'])) {
    header("Location: admin_login.php");
    exit();
}

include '../config/db.php';

if (isset($_GET['id'])) {
    $product_id = $_GET['id'];

    // Get the image filename before deleting
    $getImageQuery = $conn->prepare("SELECT product_image FROM products WHERE id = ?");
    $getImageQuery->bind_param("i", $product_id);
    $getImageQuery->execute();
    $result = $getImageQuery->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $image_path = '../uploads/' . $row['product_image'];

        // Delete the product
        $delete = $conn->prepare("DELETE FROM products WHERE id = ?");
        $delete->bind_param("i", $product_id);
        $delete->execute();

        // Remove image file
        if (file_exists($image_path)) {
            unlink($image_path);
        }

        header("Location: view_products.php?deleted=success");
        exit();
    } else {
        echo "❌ Product not found.";
    }
} else {
    echo "❌ Invalid request.";
}
?>
