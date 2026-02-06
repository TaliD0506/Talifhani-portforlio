<?php
session_start();
require_once __DIR__ . '/../includes/db_connect.php';

// Check if user is logged in
$isLoggedIn = isset($_SESSION['user_id']);
$userType = $isLoggedIn ? $_SESSION['user_type'] : '';
$username = $isLoggedIn ? $_SESSION['username'] : '';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LushakaUrithi - South African Traditional Clothing Marketplace</title>
    <link rel="stylesheet" href="/lushaka-urithi/assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header>
        <div class="top-bar">
            <div class="container">
                <div class="logo">
                    <a href="/lushaka-urithi/">
                        <img src="/lushaka-urithi/assets/images/Logo.png" alt="LushakaUrithi">
                        <span>LushakaUrithi</span>
                    </a>
                </div>
                <div class="search-bar">
                    <form action="/lushaka-urithi/search.php" method="get">
                        <input type="text" name="q" placeholder="Search for traditional attire...">
                        <select name="category">
                            <option value="">All Categories</option>
							
                            <?php
                            $stmt = $pdo->query("SELECT * FROM categories");
                            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                echo "<option value=\"{$row['category_id']}\">{$row['name']}</option>";
                            }
                            ?>
                        </select>
                        <button type="submit"><i class="fas fa-search"></i></button>
                    </form>
                </div>
                <div class="user-actions">
                    <?php if ($isLoggedIn): ?>
                        <a href="/lushaka-urithi/account.php"><i class="fas fa-user"></i> My Account</a>
                        <?php if ($userType === 'seller'): ?>
                            <a href="/lushaka-urithi/seller/dashboard.php"><i class="fas fa-store"></i> Seller Dashboard</a>
                        <?php endif; ?>
					<?php if ($userType === 'admin'): ?>
                            <a href="/lushaka-urithi/admin/dashboard.php"><i class="fas fa-cog"></i> Admin Dashboard</a>
                        <?php endif; ?>
                        <a href="/lushaka-urithi/logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    <?php else: ?>
                        <a href="/lushaka-urithi/login.php"><i class="fas fa-sign-in-alt"></i> Login</a>
                        <a href="/lushaka-urithi/register.php"><i class="fas fa-user-plus"></i> Register</a>
						 <a href="/lushaka-urithi/admin/login.php" class="admin-login"><i class="fas fa-shield-alt"></i> Admin Login</a>
                    <?php endif; ?>
                    <a href="/lushaka-urithi/cart.php"><i class="fas fa-shopping-cart"></i> Cart</a>
                </div>
            </div>
        </div>
        <nav>
            <div class="container">
                <ul>
                    <li><a href="/lushaka-urithi/">Home</a></li>
					<li><a href="/lushaka-urithi/products.php">All Products</a></li>
                    <li><a href="/lushaka-urithi/categories.php">Categories</a></li>
                    <li><a href="/lushaka-urithi/sellers.php">Sellers</a></li>
                    <li><a href="/lushaka-urithi/about.php">About Us</a></li>
                    <li><a href="/lushaka-urithi/contact.php">Contact</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <main class="container">