<?php
session_start();
require_once __DIR__ . '/../includes/db_connect.php';

// Redirect if already logged in as admin
if (isset($_SESSION['user_id']) && $_SESSION['user_type'] === 'admin') {
    header("Location: /lushaka-urithi/admin/dashboard.php");
    exit();
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $password = $_POST['password'];
    
    if (empty($username) || empty($password)) {
        $error = 'Please fill in all fields.';
    } else {
        try {
            // Check if user exists and is an admin
            $stmt = $pdo->prepare("SELECT user_id, username, password, user_type, account_status FROM users WHERE username = ? AND user_type = 'admin'");
            $stmt->execute([$username]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            
            if ($user && password_verify($password, $user['password'])) {
                if ($user['account_status'] === 'active') {
                    // Set session variables
                    $_SESSION['user_id'] = $user['user_id'];
                    $_SESSION['username'] = $user['username'];
                    $_SESSION['user_type'] = $user['user_type'];
                    
                    // Update last login
                    $stmt = $pdo->prepare("UPDATE users SET last_login = NOW() WHERE user_id = ?");
                    $stmt->execute([$user['user_id']]);
                    
                    // Redirect to admin dashboard
                    header("Location: /lushaka-urithi/admin/dashboard.php");
                    exit();
                } else {
                    $error = 'Your admin account has been suspended. Please contact the system administrator.';
                }
            } else {
                $error = 'Invalid admin credentials. Please check your username and password.';
            }
        } catch (PDOException $e) {
            $error = 'Database error. Please try again later.';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - LushakaUrithi</title>
    <link rel="stylesheet" href="/lushaka-urithi/assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .admin-login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #ff6b35 0%, #1e3a8a 100%);
            padding: 20px;
        }
        
        .admin-login-form {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        
        .admin-login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .admin-login-header .admin-icon {
            background: #dc3545;
            color: white;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 2rem;
        }
        
        .admin-login-header h1 {
            color: #333;
            margin: 0 0 10px 0;
            font-size: 1.8rem;
        }
        
        .admin-login-header p {
            color: #666;
            margin: 0;
            font-size: 0.9rem;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 600;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e1e5e9;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #dc3545;
        }
        
        .form-group .input-icon {
            position: relative;
        }
        
        .form-group .input-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }
        
        .form-group .input-icon input {
            padding-left: 45px;
        }
        
        .admin-login-btn {
            width: 100%;
            padding: 12px;
            background: #dc3545;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .admin-login-btn:hover {
            background: #c82333;
        }
        
        .admin-login-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
        }
        
        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
        }
        
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        
        .back-link a {
            color: #666;
            text-decoration: none;
            font-size: 0.9rem;
        }
        
        .back-link a:hover {
            color: #dc3545;
        }
        
        .security-notice {
            background: #fff3cd;
            color: #856404;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 20px;
            border: 1px solid #ffeaa7;
            font-size: 0.85rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="admin-login-container">
        <div class="admin-login-form">
            <div class="admin-login-header">
                <div class="admin-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h1>Admin Login</h1>
                <p>Secure access to LushakaUrithi administration panel</p>
            </div>
            
            <div class="security-notice">
                <i class="fas fa-exclamation-triangle"></i>
                This is a restricted area. Only authorized administrators are allowed.
            </div>
            
            <?php if ($error): ?>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i>
                    <?= htmlspecialchars($error) ?>
                </div>
            <?php endif; ?>
            
            <form method="POST" action="">
                <div class="form-group">
                    <label for="username">Admin Username</label>
                    <div class="input-icon">
                        <i class="fas fa-user"></i>
                        <input type="text" id="username" name="username" required 
                               value="<?= htmlspecialchars($_POST['username'] ?? '') ?>"
                               placeholder="Enter your admin username">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" required 
                               placeholder="Enter your password">
                    </div>
                </div>
                
                <button type="submit" class="admin-login-btn">
                    <i class="fas fa-sign-in-alt"></i>
                    Sign In to Admin Panel
                </button>
            </form>
            
            <div class="back-link">
                <a href="/lushaka-urithi/">
                    <i class="fas fa-arrow-left"></i>
                    Back to Main Site
                </a>
            </div>
        </div>
    </div>
    
    <script>
        // Add some basic security measures
        document.addEventListener('DOMContentLoaded', function() {
            // Disable right-click context menu
            document.addEventListener('contextmenu', function(e) {
                e.preventDefault();
            });
            
            // Disable F12, Ctrl+Shift+I, Ctrl+U
            document.addEventListener('keydown', function(e) {
                if (e.key === 'F12' || 
                    (e.ctrlKey && e.shiftKey && e.key === 'I') ||
                    (e.ctrlKey && e.key === 'u')) {
                    e.preventDefault();
                }
            });
            
            // Focus on username field
            document.getElementById('username').focus();
        });
    </script>
</body>
</html>