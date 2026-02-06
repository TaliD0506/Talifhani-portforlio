<?php
require_once 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $password = $_POST['password'];
    
    // Check if input is email or username
    $is_email = filter_var($username, FILTER_VALIDATE_EMAIL);
    
    $stmt = $pdo->prepare("SELECT * FROM users WHERE " . ($is_email ? "email" : "username") . " = ?");
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($user && password_verify($password, $user['password'])) {
        // Check account status
        if ($user['account_status'] !== 'active') {
            header("Location: /lushaka-urithi/login.php?error=account_suspended");
            exit();
        }
        
        // Set session variables
        session_start();
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['user_type'] = $user['user_type'];
        $_SESSION['email'] = $user['email'];
        $_SESSION['full_name'] = $user['full_name'];
        
        // Update last login
        $stmt = $pdo->prepare("UPDATE users SET last_login = NOW() WHERE user_id = ?");
        $stmt->execute([$user['user_id']]);
        
        // Redirect based on user type
        if ($user['user_type'] === 'admin') {
            header("Location: /lushaka-urithi/admin/dashboard.php");
        } elseif ($user['user_type'] === 'seller') {
            header("Location: /lushaka-urithi/seller/dashboard.php");
        } else {
            header("Location: /lushaka-urithi/");
        }
        exit();
    } else {
        header("Location: /lushaka-urithi/login.php?error=invalid_credentials");
        exit();
    }
} else {
    header("Location: /lushaka-urithi/login.php");
    exit();
}
?>