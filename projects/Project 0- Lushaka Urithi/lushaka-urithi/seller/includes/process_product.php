<?php
require_once(__DIR__ . '/../includes/db_connect.php'); // Corrected path to db_connect.php

session_start();

// Redirect if not a seller
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: /lushaka-urithi/login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';
    $seller_id = $_SESSION['user_id'];
    
    if ($action === 'add') {
        // Validate inputs
        $name = trim($_POST['name']);
        $category_id = (int)$_POST['category_id'];
        $description = trim($_POST['description']);
        $cultural_origin = trim($_POST['cultural_origin']);
        $price = (float)$_POST['price'];
        $quantity = (int)$_POST['quantity'];
        $size = trim($_POST['size']);
        $color = trim($_POST['color']);
        $material = trim($_POST['material']);
        
        // Handle image uploads
        // CORRECTED PATH HERE
        $upload_dir = __DIR__ . '/../../assets/uploads/products/'; 
        $images = [];
        
        // Allowed file types and max size
        $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
        $max_size = 5 * 1024 * 1024; // 5MB
        
        // Process main image
        if (isset($_FILES['main_image']) && $_FILES['main_image']['error'] === UPLOAD_ERR_OK) {
            $file_ext = pathinfo($_FILES['main_image']['name'], PATHINFO_EXTENSION);
            $file_name = uniqid('product_') . '.' . $file_ext;
            $upload_path = $upload_dir . $file_name;
            
            if (in_array($_FILES['main_image']['type'], $allowed_types)) {
                if ($_FILES['main_image']['size'] <= $max_size) {
                    if (move_uploaded_file($_FILES['main_image']['tmp_name'], $upload_path)) {
                        $images[] = $file_name;
                    } else {
                        $_SESSION['error'] = "Failed to upload main image.";
                        header("Location: /lushaka-urithi/seller/add_product.php");
                        exit();
                    }
                } else {
                    $_SESSION['error'] = "Main image size exceeds 5MB.";
                    header("Location: /lushaka-urithi/seller/add_product.php");
                    exit();
                }
            } else {
                $_SESSION['error'] = "Invalid main image file type. Only JPEG, PNG, GIF allowed.";
                header("Location: /lushaka-urithi/seller/add_product.php");
                exit();
            }
        } else {
            $_SESSION['error'] = "Main image is required."; // Main image is required based on form
            header("Location: /lushaka-urithi/seller/add_product.php");
            exit();
        }
        
        // Process additional images
        if (!empty($_FILES['additional_images']['name'][0])) {
            foreach ($_FILES['additional_images']['tmp_name'] as $key => $tmp_name) {
                if ($_FILES['additional_images']['error'][$key] === UPLOAD_ERR_OK) {
                    $file_ext = pathinfo($_FILES['additional_images']['name'][$key], PATHINFO_EXTENSION);
                    $file_name = uniqid('product_') . '.' . $file_ext;
                    $upload_path = $upload_dir . $file_name;
                    
                    if (in_array($_FILES['additional_images']['type'][$key], $allowed_types)) {
                        if ($_FILES['additional_images']['size'][$key] <= $max_size) {
                            if (move_uploaded_file($tmp_name, $upload_path)) {
                                $images[] = $file_name;
                            } else {
                                $_SESSION['error'] = "Failed to upload additional image: " . $_FILES['additional_images']['name'][$key];
                                header("Location: /lushaka-urithi/seller/add_product.php");
                                exit();
                            }
                        } else {
                            $_SESSION['error'] = "Additional image size exceeds 5MB: " . $_FILES['additional_images']['name'][$key];
                            header("Location: /lushaka-urithi/seller/add_product.php");
                            exit();
                        }
                    } else {
                        $_SESSION['error'] = "Invalid additional image file type: " . $_FILES['additional_images']['name'][$key];
                        header("Location: /lushaka-urithi/seller/add_product.php");
                        exit();
                    }
                }
            }
        }
        
        if (empty($images)) {
            $_SESSION['error'] = "Please upload at least one product image.";
            header("Location: /lushaka-urithi/seller/add_product.php");
            exit();
        }
        
        // Insert product into database
        try {
            $pdo->beginTransaction();
            
            $images_str = implode(',', $images);
            
            $stmt = $pdo->prepare("INSERT INTO products 
                                  (seller_id, category_id, name, description, price, quantity, size, color, material, cultural_origin, images) 
                                  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([
                $seller_id,
                $category_id,
                $name,
                $description,
                $price,
                $quantity,
                $size,
                $color,
                $material,
                $cultural_origin,
                $images_str
            ]);
            
            $pdo->commit();
            
            $_SESSION['success'] = "Product added successfully!";
            header("Location: /lushaka-urithi/seller/dashboard.php?tab=products");
            exit();
        } catch (Exception $e) {
            $pdo->rollBack();
            
            // Delete uploaded images if transaction failed
            foreach ($images as $image) {
                if (file_exists($upload_dir . $image)) {
                    unlink($upload_dir . $image);
                }
            }
            
            $_SESSION['error'] = "An error occurred while adding the product: " . $e->getMessage(); // Added error message for debugging
            header("Location: /lushaka-urithi/seller/add_product.php");
            exit();
        }
    } elseif ($action === 'edit') {
        // The edit logic is in edit_product.php, so this block can remain empty or be removed if not used here.
    }
} else {
    header("Location: /lushaka-urithi/seller/dashboard.php");
    exit();
}
?>
