<?php
require_once __DIR__ . '/includes/db_connect.php';

// Check token
$token = $_GET['token'] ?? '';

if (empty($token)) {
    header("Location: /lushaka-urithi/forgot_password.php");
    exit();
}

// Verify token
$stmt = $pdo->prepare("SELECT pr.*, u.email 
                      FROM password_resets pr
                      JOIN users u ON pr.user_id = u.user_id
                      WHERE pr.token = ? AND pr.expires_at > NOW() AND pr.used = 0");
$stmt->execute([$token]);
$reset_request = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$reset_request) {
    header("Location: /lushaka-urithi/forgot_password.php?error=invalid_token");
    exit();
}

// Handle password reset
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    
    if ($password !== $confirm_password) {
        $error = "Passwords do not match";
    } elseif (strlen($password) < 8) {
        $error = "Password must be at least 8 characters";
    } else {
        // Update password
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        
        try {
            $pdo->beginTransaction();
            
            // Update user password
            $stmt = $pdo->prepare("UPDATE users SET password = ? WHERE user_id = ?");
            $stmt->execute([$hashed_password, $reset_request['user_id']]);
            
            // Mark token as used
            $stmt = $pdo->prepare("UPDATE password_resets SET used = 1 WHERE token = ?");
            $stmt->execute([$token]);
            
            $pdo->commit();
            
            header("Location: /lushaka-urithi/login.php?reset=success");
            exit();
        } catch (Exception $e) {
            $pdo->rollBack();
            $error = "An error occurred. Please try again.";
        }
    }
}

require_once 'templates/header.php';
?>

<section class="auth-container">
    <h2>Reset Your Password</h2>
    
    <?php if (isset($error)): ?>
        <div class="alert alert-danger"><?= $error ?></div>
    <?php endif; ?>
    
    <form action="/lushaka-urithi/reset_password.php?token=<?= $token ?>" method="post">
        <div class="form-group">
            <label for="password">New Password:</label>
            <input type="password" id="password" name="password" required minlength="8">
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm New Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" required minlength="8">
        </div>
        <button type="submit" class="btn">Reset Password</button>
    </form>
</section>

<?php require_once 'templates/footer.php'; ?>