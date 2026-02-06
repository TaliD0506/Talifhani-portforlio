<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'seller') {
    header("Location: ../login.php");
    exit();
}

include '../db.php';

$name = $_POST['name'];
$description = $_POST['description'];
$category = $_POST['category'];
$price = $_POST['price'];
$seller_id = $_SESSION['user_id'];

$image = $_FILES['image']['name'];
$temp = $_FILES['image']['tmp_name'];
$folder = "../uploads/" . $image;

if (move_uploaded_file($temp, $folder)) {
    $sql = "INSERT INTO products (seller_id, name, description, category, price, image) 
            VALUES ('$seller_id', '$name', '$description', '$category', '$price', '$image')";
    if (mysqli_query($conn, $sql)) {
        echo "Product uploaded successfully. <a href='upload_product.php'>Upload another</a> or <a href='dashboard.php'>Go to dashboard</a>";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
} else {
    echo "Image upload failed.";
}
?>
