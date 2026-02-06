<?php
require_once 'templates/header.php';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    
    require_once __DIR__ . '/includes/db_connect.php';
    
    // Check if email exists
    $stmt = $pdo->prepare("SELECT user_id, username FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($user) {
        // Generate reset token
        $token = bin2hex(random_bytes(32));
        $expires = date('Y-m-d H:i:s', strtotime('+1 hour'));
        
        // Store token in database
        $stmt = $pdo->prepare("INSERT INTO password_resets (user_id, token, expires_at) VALUES (?, ?, ?)");
        $stmt->execute([$user['user_id'], $token, $expires]);
        
        // Send reset email (in production, use a proper mailer)
        $reset_link = "http://$_SERVER[HTTP_HOST]/lushaka-urithi/reset_password.php?token=$token";
        $subject = "Password Reset Request";
        $message = "Hello {$user['username']},\n\n";
        $message .= "You requested to reset your password. Please click the following link to reset your password:\n\n";
        $message .= "$reset_link\n\n";
        $message .= "This link will expire in 1 hour.\n\n";
        $message .= "If you didn't request this, please ignore this email.\n";
        
        // In production, use PHPMailer or similar
        // mail($email, $subject, $message);
        
        // For demo purposes, we'll show the link
        $demo_link = true;
    }
    
    // Always show success message to prevent email enumeration
    $success = true;
}
?>

<section class="auth-container">
    <h2>Forgot Password</h2>
    
    <?php if (isset($success)): ?>
        <div class="alert alert-success">
            <p>If an account with that email exists, we've sent a password reset link.</p>
            <?php if (isset($demo_link)): ?>
                <p>For demo purposes: <a href="<?= $reset_link ?>"><?= $reset_link ?></a></p>
            <?php endif; ?>
        </div>
    <?php endif; ?>
    
    <form action="/lushaka-urithi/forgot_password.php" method="post">
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <button type="submit" class="btn">Reset Password</button>
    </form>
    
    <div class="auth-footer">
        <p>Remember your password? <a href="/lushaka-urithi/login.php">Login here</a></p>
    </div>
</section>

<?php require_once 'templates/footer.php'; ?>