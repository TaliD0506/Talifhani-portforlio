<?php require_once 'templates/header.php'; ?>

<div class="auth-container">
    <h2>Login to Your Account</h2>
    <?php if (isset($_GET['error'])): ?>
        <div class="alert alert-danger">
            <?php 
            switch ($_GET['error']) {
                case 'invalid_credentials':
                    echo "Invalid username or password.";
                    break;
                case 'account_suspended':
                    echo "Your account has been suspended. Please contact support.";
                    break;
                default:
                    echo "An error occurred. Please try again.";
            }
            ?>
        </div>
    <?php endif; ?>
    
    <?php if (isset($_GET['registration'])): ?>
        <div class="alert alert-success">
            Registration successful! Please login.
        </div>
    <?php endif; ?>
    
    <form action="/lushaka-urithi/includes/login_process.php" method="post">
        <div class="form-group">
            <label for="username">Username or Email:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="btn">Login</button>
        <div class="form-footer">
            <a href="/lushaka-urithi/forgot_password.php">Forgot Password?</a>
            <p>Don't have an account? <a href="/lushaka-urithi/register.php">Register here</a></p>
        </div>
    </form>
</div>

<?php require_once 'templates/footer.php'; ?>