<?php
session_start();
require_once __DIR__ . '/db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validate inputs
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $full_name = trim($_POST['full_name']);
    $phone = trim($_POST['phone']);
    $user_type = $_POST['user_type'];
    
    // Validate password match
    if ($password !== $confirm_password) {
        header("Location: /lushaka-urithi/register.php?error=password_mismatch");
        exit();
    }
    
    // Check if username or email exists
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ? OR email = ?");
    $stmt->execute([$username, $email]);
    
    if ($stmt->rowCount() > 0) {
        header("Location: /lushaka-urithi/register.php?error=user_exists");
        exit();
    }
    
    // Handle profile picture upload
    $profile_pic = null;
    if (isset($_FILES['profile_pic']) && $_FILES['profile_pic']['error'] === UPLOAD_ERR_OK) {
        $upload_dir = '../assets/uploads/profile_pics/';
        $file_ext = pathinfo($_FILES['profile_pic']['name'], PATHINFO_EXTENSION);
        $file_name = uniqid('profile_') . '.' . $file_ext;
        $upload_path = $upload_dir . $file_name;
        
        // Check file type and size
        $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
        $max_size = 2 * 1024 * 1024; // 2MB
        
        if (in_array($_FILES['profile_pic']['type'], $allowed_types)) {
            if ($_FILES['profile_pic']['size'] <= $max_size) {
                if (move_uploaded_file($_FILES['profile_pic']['tmp_name'], $upload_path)) {
                    $profile_pic = 'assets/uploads/profile_pics/' . $file_name;
                }
            }
        }
    }
    
    // Hash password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    
    // Insert user into database
    $stmt = $pdo->prepare("INSERT INTO users (username, password, email, full_name, phone, profile_pic, user_type) 
                          VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$username, $hashed_password, $email, $full_name, $phone, $profile_pic, $user_type]);
    
    // Redirect to login page
    header("Location: /lushaka-urithi/login.php?registration=success");
    exit();
} else {
    header("Location: /lushaka-urithi/register.php");
    exit();
}
?>