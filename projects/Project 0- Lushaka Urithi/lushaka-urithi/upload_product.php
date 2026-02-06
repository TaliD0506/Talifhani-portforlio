<?php
session_start();
include("includes/db_connect.php"); 

// Check if seller is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

if (isset($_POST['submit'])) {
    // Get form data
    $product_name = $_POST['product_name'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $category = $_POST['category'];
    $seller_id = $_SESSION['user_id'];

    // Handle image upload
    $image_name = $_FILES['image']['name'];
    $image_tmp = $_FILES['image']['tmp_name'];
    $image_folder = "uploads/";
    $image_path = $image_folder . basename($image_name);

    // Make sure image folder exists
    if (!file_exists($image_folder)) {
        mkdir($image_folder, 0777, true);
    }

    if (move_uploaded_file($image_tmp, $image_path)) {
        // Insert into DB
        $status = 'active';
$query = "INSERT INTO products (seller_id, product_name, description, price, category, image_path, status)
          VALUES ('$seller_id', '$product_name', '$description', '$price', '$category', '$image_path', '$status')";


        if (mysqli_query($conn, $query)) {
            header("Location: seller/dashboard.php?upload=success");
            exit();
        } else {
            echo "Database error: " . mysqli_error($conn);
        }
    } else {
        echo "Image upload failed. Try again.";
    }
} else {
    echo "Form not submitted correctly.";
}
?>
