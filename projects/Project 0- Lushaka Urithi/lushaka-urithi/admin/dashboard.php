<?php
require_once("../templates/header.php");

// Redirect if not admin
if ($userType !== 'admin') {
    header("Location: /lushaka-urithi/");
    exit();
}

// Get current tab or default to dashboard
$tab = isset($_GET['tab']) ? $_GET['tab'] : 'dashboard';

// Fetch stats for dashboard
if ($tab === 'dashboard') {
    // Total users
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM users");
    $total_users = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
    
    // Total sellers
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM users WHERE user_type = 'seller'");
    $total_sellers = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
    
    // Total products
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM products");
    $total_products = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
    
    // Total orders
    $stmt = $pdo->query("SELECT COUNT(*) as total FROM orders");
    $total_orders = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
    
    // Recent orders
    $stmt = $pdo->query("SELECT o.*, u.username as buyer_name 
                        FROM orders o 
                        JOIN users u ON o.buyer_id = u.user_id 
                        ORDER BY o.order_date DESC 
                        LIMIT 5");
    $recent_orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch users for users tab
if ($tab === 'users') {
    $stmt = $pdo->query("SELECT * FROM users ORDER BY registration_date DESC");
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch products for products tab
if ($tab === 'products') {
    $stmt = $pdo->query("SELECT p.*, u.username as seller_name, c.name as category_name 
                        FROM products p 
                        JOIN users u ON p.seller_id = u.user_id 
                        JOIN categories c ON p.category_id = c.category_id 
                        ORDER BY p.listing_date DESC");
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch orders for orders tab
if ($tab === 'orders') {
    $stmt = $pdo->query("SELECT o.*, u.username as buyer_name 
                        FROM orders o 
                        JOIN users u ON o.buyer_id = u.user_id 
                        ORDER BY o.order_date DESC");
    $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch categories for categories tab
if ($tab === 'categories') {
    $stmt = $pdo->query("SELECT * FROM categories ORDER BY name");
    $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<section class="admin-dashboard">
    <div class="dashboard-header">
        <h1>Admin Dashboard</h1>
        <p>Manage the LushakaUrithi platform</p>
    </div>
    
    <div class="dashboard-nav">
        <ul>
            <li class="<?= $tab === 'dashboard' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/admin/dashboard.php?tab=dashboard">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
            </li>
            <li class="<?= $tab === 'users' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/admin/dashboard.php?tab=users">
                    <i class="fas fa-users"></i> Users
                </a>
            </li>
            <li class="<?= $tab === 'products' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/admin/dashboard.php?tab=products">
                    <i class="fas fa-tshirt"></i> Products
                </a>
            </li>
            <li class="<?= $tab === 'orders' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/admin/dashboard.php?tab=orders">
                    <i class="fas fa-shopping-bag"></i> Orders
                </a>
            </li>
            <li class="<?= $tab === 'categories' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/admin/dashboard.php?tab=categories">
                    <i class="fas fa-tags"></i> Categories
                </a>
            </li>
            <li>
                <a href="/lushaka-urithi/">
                    <i class="fas fa-home"></i> Back to Site
                </a>
            </li>
        </ul>
    </div>
    
    <div class="dashboard-content">
        <?php if ($tab === 'dashboard'): ?>
            <div class="admin-stats">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Total Users</h3>
                        <span><?= $total_users ?></span>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-store"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Sellers</h3>
                        <span><?= $total_sellers ?></span>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-tshirt"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Products</h3>
                        <span><?= $total_products ?></span>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-shopping-bag"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Orders</h3>
                        <span><?= $total_orders ?></span>
                    </div>
                </div>
            </div>
            
            <div class="recent-orders">
                <h3>Recent Orders</h3>
                <?php if (empty($recent_orders)): ?>
                    <p>No recent orders.</p>
                <?php else: ?>
                    <table>
                        <thead>
                            <tr>
                                <th>Order #</th>
                                <th>Buyer</th>
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
                                    <td><?= $order['buyer_name'] ?></td>
                                    <td><?= date('M j, Y', strtotime($order['order_date'])) ?></td>
                                    <td>R <?= number_format($order['total_amount'], 2) ?></td>
                                    <td><span class="status-badge <?= $order['status'] ?>"><?= ucfirst($order['status']) ?></span></td>
                                    <td><a href="/lushaka-urithi/admin/order_details.php?id=<?= $order['order_id'] ?>" class="btn-view">View</a></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                    <a href="/lushaka-urithi/admin/dashboard.php?tab=orders" class="btn-view-all">View All Orders</a>
                <?php endif; ?>
            </div>
            
        <?php elseif ($tab === 'users'): ?>
            <div class="section-header">
                <h2>Users</h2>
                <a href="/lushaka-urithi/admin/add_user.php" class="btn btn-primary">Add New User</a>
            </div>
            
            <?php if (empty($users)): ?>
                <div class="empty-state">
                    <p>No users found.</p>
                </div>
            <?php else: ?>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Type</th>
                            <th>Status</th>
                            <th>Registered</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($users as $user): ?>
                            <tr>
                                <td><?= $user['user_id'] ?></td>
                                <td>
                                    <div class="user-info">
                                        <img src="/lushaka-urithi/assets/uploads/profile_pics/<?= $user['profile_pic'] ?? 'default.jpg' ?>" alt="<?= $user['username'] ?>" width="30">
                                        <?= $user['username'] ?>
                                    </div>
                                </td>
                                <td><?= $user['email'] ?></td>
                                <td><?= ucfirst($user['user_type']) ?></td>
                                <td>
                                    <span class="status-badge <?= $user['account_status'] ?>">
                                        <?= ucfirst($user['account_status']) ?>
                                    </span>
                                </td>
                                <td><?= date('M j, Y', strtotime($user['registration_date'])) ?></td>
                                <td class="actions">
                                    <a href="/lushaka-urithi/admin/edit_user.php?id=<?= $user['user_id'] ?>" class="btn-edit">Edit</a>
                                    <a href="/lushaka-urithi/admin/delete_user.php?id=<?= $user['user_id'] ?>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
            
        <?php elseif ($tab === 'products'): ?>
            <div class="section-header">
                <h2>Products</h2>
            </div>
            
            <?php if (empty($products)): ?>
                <div class="empty-state">
                    <p>No products found.</p>
                </div>
            <?php else: ?>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Product</th>
                            <th>Seller</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($products as $product): 
                            $images = explode(',', $product['images']);
                            $main_image = $images[0];
                        ?>
                            <tr>
                                <td><?= $product['product_id'] ?></td>
                                <td>
                                    <div class="product-info">
                                        <img src="/lushaka-urithi/assets/uploads/products/<?= $main_image ?>" alt="<?= $product['name'] ?>" width="50">
                                        <?= $product['name'] ?>
                                    </div>
                                </td>
                                <td><?= $product['seller_name'] ?></td>
                                <td><?= $product['category_name'] ?></td>
                                <td>R <?= number_format($product['price'], 2) ?></td>
                                <td>
                                    <span class="status-badge <?= $product['status'] ?>">
                                        <?= ucfirst($product['status']) ?>
                                    </span>
                                </td>
                                <td class="actions">
                                    <a href="/lushaka-urithi/product.php?id=<?= $product['product_id'] ?>" class="btn-view" target="_blank">View</a>
                                    <a href="/lushaka-urithi/admin/edit_product.php?id=<?= $product['product_id'] ?>" class="btn-edit">Edit</a>
                                    <a href="/lushaka-urithi/admin/delete_product.php?id=<?= $product['product_id'] ?>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
            
        <?php elseif ($tab === 'orders'): ?>
            <div class="section-header">
                <h2>Orders</h2>
            </div>
            
            <?php if (empty($orders)): ?>
                <div class="empty-state">
                    <p>No orders found.</p>
                </div>
            <?php else: ?>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Order #</th>
                            <th>Buyer</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($orders as $order): ?>
                            <tr>
                                <td>#<?= str_pad($order['order_id'], 6, '0', STR_PAD_LEFT) ?></td>
                                <td><?= $order['buyer_name'] ?></td>
                                <td><?= date('M j, Y', strtotime($order['order_date'])) ?></td>
                                <td>R <?= number_format($order['total_amount'], 2) ?></td>
                                <td>
                                    <span class="status-badge <?= $order['status'] ?>">
                                        <?= ucfirst($order['status']) ?>
                                    </span>
                                </td>
                                <td class="actions">
                                    <a href="/lushaka-urithi/admin/order_details.php?id=<?= $order['order_id'] ?>" class="btn-view">View</a>
                                    <a href="/lushaka-urithi/admin/edit_order.php?id=<?= $order['order_id'] ?>" class="btn-edit">Edit</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
            
        <?php elseif ($tab === 'categories'): ?>
            <div class="section-header">
                <h2>Categories</h2>
                <a href="/lushaka-urithi/admin/add_category.php" class="btn btn-primary">Add New Category</a>
            </div>
            
            <?php if (empty($categories)): ?>
                <div class="empty-state">
                    <p>No categories found.</p>
                </div>
            <?php else: ?>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($categories as $category): ?>
                            <tr>
                                <td><?= $category['category_id'] ?></td>
                                <td><?= $category['name'] ?></td>
                                <td class="actions">
                                    <a href="/lushaka-urithi/admin/edit_category.php?id=<?= $category['category_id'] ?>" class="btn-edit">Edit</a>
                                    <a href="/lushaka-urithi/admin/delete_category.php?id=<?= $category['category_id'] ?>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this category?')">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
        <?php endif; ?>
    </div>
</section>

<?php require_once("../templates/footer.php"); ?>