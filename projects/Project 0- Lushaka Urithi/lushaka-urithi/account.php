<?php
require_once 'templates/header.php';

// Redirect if not logged in
if (!$isLoggedIn) {
    header("Location: /lushaka-urithi/login.php");
    exit();
}

// Get current tab or default to dashboard
$tab = isset($_GET['tab']) ? $_GET['tab'] : 'dashboard';

// Fetch user details
$stmt = $pdo->prepare("SELECT * FROM users WHERE user_id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Fetch orders for the orders tab
if ($tab === 'orders') {
    $stmt = $pdo->prepare("SELECT * FROM orders WHERE buyer_id = ? ORDER BY order_date DESC");
    $stmt->execute([$_SESSION['user_id']]);
    $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch favorites for the wishlist tab
if ($tab === 'wishlist') {
    $stmt = $pdo->prepare("SELECT p.* 
                           FROM favorites f 
                           JOIN products p ON f.product_id = p.product_id 
                           WHERE f.user_id = ? AND p.status = 'active'");
    $stmt->execute([$_SESSION['user_id']]);
    $favorites = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch messages for the messages tab
if ($tab === 'messages') {
    $stmt = $pdo->prepare("SELECT m.*, u.username as sender_name, p.name as product_name 
                           FROM messages m 
                           JOIN users u ON m.sender_id = u.user_id 
                           LEFT JOIN products p ON m.product_id = p.product_id 
                           WHERE m.receiver_id = ? 
                           ORDER BY m.sent_date DESC");
    $stmt->execute([$_SESSION['user_id']]);
    $messages = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<section class="account-dashboard">
    <div class="account-sidebar">
        <div class="user-profile">
            <img src="/lushaka-urithi/assets/uploads/profile_pics/<?= $user['profile_pic'] ?? 'default.jpg' ?>" alt="<?= $user['username'] ?>">
            <h3><?= $user['full_name'] ?></h3>
            <p>@<?= $user['username'] ?></p>
        </div>
        
        <nav class="account-menu">
            <ul>
                <li class="<?= $tab === 'dashboard' ? 'active' : '' ?>">
                    <a href="/lushaka-urithi/account.php?tab=dashboard">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a>
                </li>
                <li class="<?= $tab === 'orders' ? 'active' : '' ?>">
                    <a href="/lushaka-urithi/account.php?tab=orders">
                        <i class="fas fa-shopping-bag"></i> My Orders
                    </a>
                </li>
                <li class="<?= $tab === 'wishlist' ? 'active' : '' ?>">
                    <a href="/lushaka-urithi/account.php?tab=wishlist">
                        <i class="fas fa-heart"></i> Wishlist
                    </a>
                </li>
                <li class="<?= $tab === 'messages' ? 'active' : '' ?>">
                    <a href="/lushaka-urithi/account.php?tab=messages">
                        <i class="fas fa-envelope"></i> Messages
                    </a>
                </li>
                <li class="<?= $tab === 'settings' ? 'active' : '' ?>">
                    <a href="/lushaka-urithi/account.php?tab=settings">
                        <i class="fas fa-cog"></i> Account Settings
                    </a>
                </li>
                <?php if ($userType === 'seller'): ?>
                    <li>
                        <a href="/lushaka-urithi/seller/dashboard.php">
                            <i class="fas fa-store"></i> Seller Dashboard
                        </a>
                    </li>
                <?php endif; ?>
                <li>
                    <a href="/lushaka-urithi/logout.php">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    
    <div class="account-content">
        <?php if ($tab === 'dashboard'): ?>
            <h2>Account Dashboard</h2>
            <div class="dashboard-welcome">
                <p>Hello, <?= $user['full_name'] ?>! Welcome back to your account dashboard.</p>
            </div>
            
            <div class="dashboard-stats">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-shopping-bag"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Total Orders</h3>
                        <?php
                        $stmt = $pdo->prepare("SELECT COUNT(*) as total FROM orders WHERE buyer_id = ?");
                        $stmt->execute([$_SESSION['user_id']]);
                        $total_orders = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
                        ?>
                        <span><?= $total_orders ?></span>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Wishlist Items</h3>
                        <?php
                        $stmt = $pdo->prepare("SELECT COUNT(*) as total FROM favorites WHERE user_id = ?");
                        $stmt->execute([$_SESSION['user_id']]);
                        $total_favorites = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
                        ?>
                        <span><?= $total_favorites ?></span>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Unread Messages</h3>
                        <?php
                        $stmt = $pdo->prepare("SELECT COUNT(*) as total FROM messages WHERE receiver_id = ? AND is_read = FALSE");
                        $stmt->execute([$_SESSION['user_id']]);
                        $total_unread = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
                        ?>
                        <span><?= $total_unread ?></span>
                    </div>
                </div>
            </div>
            
            <div class="recent-orders">
                <h3>Recent Orders</h3>
                <?php
                $stmt = $pdo->prepare("SELECT * FROM orders WHERE buyer_id = ? ORDER BY order_date DESC LIMIT 3");
                $stmt->execute([$_SESSION['user_id']]);
                $recent_orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
                
                if (empty($recent_orders)): ?>
                    <p>You haven't placed any orders yet.</p>
                <?php else: ?>
                    <table>
                        <thead>
                            <tr>
                                <th>Order #</th>
                                <th>Date</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($recent_orders as $order): ?>
                                <tr>
                                    <td>#<?= str_pad($order['order_id'], 6, '0', STR_PAD_LEFT) ?></td>
                                    <td><?= date('M j, Y', strtotime($order['order_date'])) ?></td>
                                    <td>R <?= number_format($order['total_amount'], 2) ?></td>
                                    <td><span class="status-badge <?= $order['status'] ?>"><?= ucfirst($order['status']) ?></span></td>
                                    <td><a href="/lushaka-urithi/order_details.php?id=<?= $order['order_id'] ?>" class="btn-view">View</a></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                    <a href="/lushaka-urithi/account.php?tab=orders" class="btn-view-all">View All Orders</a>
                <?php endif; ?>
            </div>
            
        <?php elseif ($tab === 'orders'): ?>
            <h2>My Orders</h2>
            
            <?php if (empty($orders)): ?>
                <div class="empty-state">
                    <i class="fas fa-shopping-bag"></i>
                    <p>You haven't placed any orders yet.</p>
                    <a href="/lushaka-urithi/products.php" class="btn">Start Shopping</a>
                </div>
            <?php else: ?>
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Order #</th>
                            <th>Date</th>
                            <th>Items</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($orders as $order): 
                            // Count items in order
                            $stmt = $pdo->prepare("SELECT COUNT(*) as item_count FROM order_items WHERE order_id = ?");
                            $stmt->execute([$order['order_id']]);
                            $item_count = $stmt->fetch(PDO::FETCH_ASSOC)['item_count'];
                        ?>
                            <tr>
                                <td>#<?= str_pad($order['order_id'], 6, '0', STR_PAD_LEFT) ?></td>
                                <td><?= date('M j, Y', strtotime($order['order_date'])) ?></td>
                                <td><?= $item_count ?> item<?= $item_count != 1 ? 's' : '' ?></td>
                                <td>R <?= number_format($order['total_amount'], 2) ?></td>
                                <td><span class="status-badge <?= $order['status'] ?>"><?= ucfirst($order['status']) ?></span></td>
                                <td><a href="/lushaka-urithi/seller/order_details.php?id=<?= $order['order_id'] ?>" class="btn-view">View Details</a></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
            
        <?php elseif ($tab === 'wishlist'): ?>
            <h2>My Wishlist</h2>
            
            <?php if (empty($favorites)): ?>
                <div class="empty-state">
                    <i class="fas fa-heart"></i>
                    <p>Your wishlist is empty.</p>
                    <a href="/lushaka-urithi/products.php" class="btn">Browse Products</a>
                </div>
            <?php else: ?>
                <div class="wishlist-grid">
                    <?php foreach ($favorites as $product): 
                        $images = explode(',', $product['images']);
                        $main_image = $images[0];
                    ?>
                        <div class="wishlist-item">
                            <div class="item-image">
                                <a href="/lushaka-urithi/product.php?id=<?= $product['product_id'] ?>">
                                    <img src="/lushaka-urithi/assets/uploads/products/<?= $main_image ?>" alt="<?= $product['name'] ?>">
                                </a>
                            </div>
                            <div class="item-details">
                                <h3><a href="/lushaka-urithi/product.php?id=<?= $product['product_id'] ?>"><?= $product['name'] ?></a></h3>
                                <p class="price">R <?= number_format($product['price'], 2) ?></p>
                                <p class="stock"><?= $product['quantity'] > 0 ? 'In Stock' : 'Out of Stock' ?></p>
                            </div>
                            <div class="item-actions">
                                <button class="btn-add-to-cart" data-product-id="<?= $product['product_id'] ?>">Add to Cart</button>
                                <button class="btn-remove-wishlist" data-product-id="<?= $product['product_id'] ?>">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
            
        <?php elseif ($tab === 'messages'): ?>
            <h2>My Messages</h2>
            
            <?php if (empty($messages)): ?>
                <div class="empty-state">
                    <i class="fas fa-envelope"></i>
                    <p>You have no messages.</p>
                </div>
            <?php else: ?>
                <div class="messages-list">
                    <?php foreach ($messages as $message): ?>
                        <div class="message <?= !$message['is_read'] ? 'unread' : '' ?>" data-message-id="<?= $message['message_id'] ?>">
                            <div class="message-sender">
                                <img src="/lushaka-urithi/assets/uploads/profile_pics/<?= $message['profile_pic'] ?? 'default.jpg' ?>" alt="<?= $message['sender_name'] ?>">
                                <h4><?= $message['sender_name'] ?></h4>
                            </div>
                            <div class="message-content">
                                <?php if ($message['product_id']): ?>
                                    <p class="message-product">Regarding: <?= $message['product_name'] ?></p>
                                <?php endif; ?>
                                <h3><?= $message['subject'] ?></h3>
                                <p><?= nl2br(htmlspecialchars(substr($message['message'], 0, 150))) ?>...</p>
                                <p class="message-date"><?= date('M j, Y g:i a', strtotime($message['sent_date'])) ?></p>
                            </div>
                            <a href="/lushaka-urithi/message.php?id=<?= $message['message_id'] ?>" class="btn-view-message">View Message</a>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
            
        <?php elseif ($tab === 'settings'): ?>
            <h2>Account Settings</h2>
            
            <div class="settings-tabs">
                <button class="tab-btn active" data-tab="profile">Profile</button>
                <button class="tab-btn" data-tab="password">Password</button>
                <button class="tab-btn" data-tab="address">Address</button>
            </div>
            
            <div class="tab-content active" id="profile-tab">
                <form action="/lushaka-urithi/includes/update_profile.php" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="full_name">Full Name:</label>
                        <input type="text" id="full_name" name="full_name" value="<?= htmlspecialchars($user['full_name']) ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<?= htmlspecialchars($user['email']) ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number:</label>
                        <input type="tel" id="phone" name="phone" value="<?= htmlspecialchars($user['phone']) ?>">
                    </div>
                    <div class="form-group">
                        <label for="profile_pic">Profile Picture:</label>
                        <input type="file" id="profile_pic" name="profile_pic" accept="image/*">
                        <?php if ($user['profile_pic']): ?>
                            <div class="current-profile-pic">
                                <img src="/lushaka-urithi/assets/uploads/profile_pics/<?= $user['profile_pic'] ?>" alt="Current Profile Picture">
                                <label><input type="checkbox" name="remove_profile_pic"> Remove current picture</label>
                            </div>
                        <?php endif; ?>
                    </div>
                    <button type="submit" class="btn">Update Profile</button>
                </form>
            </div>
            
            <div class="tab-content" id="password-tab">
                <form action="/lushaka-urithi/includes/update_password.php" method="post">
                    <div class="form-group">
                        <label for="current_password">Current Password:</label>
                        <input type="password" id="current_password" name="current_password" required>
                    </div>
                    <div class="form-group">
                        <label for="new_password">New Password:</label>
                        <input type="password" id="new_password" name="new_password" required>
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">Confirm New Password:</label>
                        <input type="password" id="confirm_password" name="confirm_password" required>
                    </div>
                    <button type="submit" class="btn">Change Password</button>
                </form>
            </div>
            
            <div class="tab-content" id="address-tab">
                <form action="/lushaka-urithi/includes/update_address.php" method="post">
                    <div class="form-group">
                        <label for="address">Street Address:</label>
                        <input type="text" id="address" name="address" value="<?= htmlspecialchars($user['address']) ?>">
                    </div>
                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" id="city" name="city" value="<?= htmlspecialchars($user['city']) ?>">
                    </div>
                    <div class="form-group">
                        <label for="province">Province:</label>
                        <select id="province" name="province">
                            <option value="">Select Province</option>
                            <option value="Eastern Cape" <?= $user['province'] === 'Eastern Cape' ? 'selected' : '' ?>>Eastern Cape</option>
                            <option value="Free State" <?= $user['province'] === 'Free State' ? 'selected' : '' ?>>Free State</option>
                            <option value="Gauteng" <?= $user['province'] === 'Gauteng' ? 'selected' : '' ?>>Gauteng</option>
                            <option value="KwaZulu-Natal" <?= $user['province'] === 'KwaZulu-Natal' ? 'selected' : '' ?>>KwaZulu-Natal</option>
                            <option value="Limpopo" <?= $user['province'] === 'Limpopo' ? 'selected' : '' ?>>Limpopo</option>
                            <option value="Mpumalanga" <?= $user['province'] === 'Mpumalanga' ? 'selected' : '' ?>>Mpumalanga</option>
                            <option value="North West" <?= $user['province'] === 'North West' ? 'selected' : '' ?>>North West</option>
                            <option value="Northern Cape" <?= $user['province'] === 'Northern Cape' ? 'selected' : '' ?>>Northern Cape</option>
                            <option value="Western Cape" <?= $user['province'] === 'Western Cape' ? 'selected' : '' ?>>Western Cape</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="postal_code">Postal Code:</label>
                        <input type="text" id="postal_code" name="postal_code" value="<?= htmlspecialchars($user['postal_code']) ?>">
                    </div>
                    <button type="submit" class="btn">Update Address</button>
                </form>
            </div>
        <?php endif; ?>
    </div>
</section>

<script>
// Tab functionality for settings
document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        // Remove active class from all buttons and content
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
        
        // Add active class to clicked button
        this.classList.add('active');
        
        // Show corresponding content
        const tabId = this.dataset.tab + '-tab';
        document.getElementById(tabId).classList.add('active');
    });
});
</script>

<?php require_once 'templates/footer.php'; ?>