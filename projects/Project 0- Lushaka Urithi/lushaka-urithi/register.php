<?php require_once 'templates/header.php';
 ?>

<div class="auth-container">
    <h2>Create Your Account</h2>
    <form action="/lushaka-urithi/includes/register_process.php" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>
        </div>
        <div class="form-group">
            <label for="full_name">Full Name:</label>
            <input type="text" id="full_name" name="full_name" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone">
        </div>
        <div class="form-group">
            <label for="user_type">I want to:</label>
            <select id="user_type" name="user_type">
                <option value="buyer">Buy traditional clothing</option>
                <option value="seller">Sell traditional clothing</option>
            </select>
        </div>
        <div class="form-group">
            <label for="profile_pic">Profile Picture (optional):</label>
            <input type="file" id="profile_pic" name="profile_pic" accept="image/*">
        </div>
        <button type="submit" class="btn">Register</button>
    </form>
    <p>Already have an account? <a href="/lushaka-urithi/login.php">Login here</a></p>
</div>

<?php require_once 'templates/footer.php'; ?>