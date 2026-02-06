<?php
require_once(__DIR__ . '/../templates/header.php');

// Redirect if not a seller
if ($userType !== 'seller') {
    header("Location: /lushaka-urithi/");
    exit();
}

// Get current tab or default to dashboard
$tab = isset($_GET['tab']) ? $_GET['tab'] : 'dashboard';

// Fetch seller's products
if ($tab === 'products') {
    $stmt = $pdo->prepare("SELECT p.*, c.name as category_name 
                           FROM products p 
                           JOIN categories c ON p.category_id = c.category_id 
                           WHERE p.seller_id = ? 
                           ORDER BY p.listing_date DESC");
    $stmt->execute([$_SESSION['user_id']]);
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch seller's orders
if ($tab === 'orders') {
    $stmt = $pdo->prepare("SELECT o.*, u.username as buyer_name 
                           FROM orders o 
                           JOIN order_items oi ON o.order_id = oi.order_id 
                           JOIN products p ON oi.product_id = p.product_id 
                           JOIN users u ON o.buyer_id = u.user_id 
                           WHERE p.seller_id = ? 
                           GROUP BY o.order_id 
                           ORDER BY o.order_date DESC");
    $stmt->execute([$_SESSION['user_id']]);
    $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch seller's messages
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

// Fetch seller's reviews
if ($tab === 'reviews') {
    $stmt = $pdo->prepare("SELECT r.*, p.name as product_name, u.username as reviewer_name 
                           FROM reviews r 
                           JOIN products p ON r.product_id = p.product_id 
                           JOIN users u ON r.reviewer_id = u.user_id 
                           WHERE p.seller_id = ? 
                           ORDER BY r.review_date DESC");
    $stmt->execute([$_SESSION['user_id']]);
    $reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<section class="seller-dashboard">
    <div class="dashboard-header">
        <h1>Seller Dashboard</h1>
        <p>Manage your store and sales</p>
    </div>
    
    <div class="dashboard-nav">
        <ul>
            <li class="<?= $tab === 'dashboard' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/seller/dashboard.php?tab=dashboard">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
            </li>
            <li class="<?= $tab === 'products' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/seller/dashboard.php?tab=products">
                    <i class="fas fa-tshirt"></i> Products
                </a>
            </li>
            <li class="<?= $tab === 'orders' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/seller/dashboard.php?tab=orders">
                    <i class="fas fa-shopping-bag"></i> Orders
                </a>
            </li>
            <li class="<?= $tab === 'messages' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/seller/dashboard.php?tab=messages">
                    <i class="fas fa-envelope"></i> Messages
                </a>
            </li>
            <li class="<?= $tab === 'reviews' ? 'active' : '' ?>">
                <a href="/lushaka-urithi/seller/dashboard.php?tab=reviews">
                    <i class="fas fa-star"></i> Reviews
                </a>
            </li>
            <li>
                <a href="/lushaka-urithi/account.php">
                    <i class="fas fa-user"></i> My Account
                </a>
            </li>
        </ul>
    </div>
    
    <div class="dashboard-content">
        <?php if ($tab === 'dashboard'): ?>
            <div class="seller-stats">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-tshirt"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Total Products</h3>
                        <?php
                        $stmt = $pdo->prepare("SELECT COUNT(*) as total FROM products WHERE seller_id = ?");
                        $stmt->execute([$_SESSION['user_id']]);
                        $total_products = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
                        ?>
                        <span><?= $total_products ?></span>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-shopping-bag"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Total Orders</h3>
                        <?php
                        $stmt = $pdo->prepare("SELECT COUNT(DISTINCT o.order_id) as total 
                                               FROM orders o 
                                               JOIN order_items oi ON o.order_id = oi.order_id 
                                               JOIN products p ON oi.product_id = p.product_id 
                                               WHERE p.seller_id = ?");
                        $stmt->execute([$_SESSION['user_id']]);
                        $total_orders = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
                        ?>
                        <span><?= $total_orders ?></span>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-money-bill-wave"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Total Revenue</h3>
                        <?php
                        $stmt = $pdo->prepare("SELECT SUM(oi.price * oi.quantity) as total 
                                               FROM order_items oi 
                                               JOIN products p ON oi.product_id = p.product_id 
                                               WHERE p.seller_id = ?");
                        $stmt->execute([$_SESSION['user_id']]);
                        $total_revenue = $stmt->fetch(PDO::FETCH_ASSOC)['total'] ?? 0;
                        ?>
                        <span>R <?= number_format($total_revenue, 2) ?></span>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Average Rating</h3>
                        <?php
                        $stmt = $pdo->prepare("SELECT AVG(r.rating) as average 
                                               FROM reviews r 
                                               JOIN products p ON r.product_id = p.product_id 
                                               WHERE p.seller_id = ?");
                        $stmt->execute([$_SESSION['user_id']]);
                        $avg_rating = $stmt->fetch(PDO::FETCH_ASSOC)['average'] ?? 0;
                        ?>
                        <span><?= number_format($avg_rating, 1) ?> <i class="fas fa-star"></i></span>
                    </div>
                </div>
            </div>
            
            <div class="recent-orders">
                <h3>Recent Orders</h3>
                <?php
                $stmt = $pdo->prepare("SELECT o.*, u.username as buyer_name 
                                      FROM orders o 
                                      JOIN order_items oi ON o.order_id = oi.order_id 
                                      JOIN products p ON oi.product_id = p.product_id 
                                      JOIN users u ON o.buyer_id = u.user_id 
                                      WHERE p.seller_id = ? 
                                      GROUP BY o.order_id 
                                      ORDER BY o.order_date DESC 
                                      LIMIT 5");
                $stmt->execute([$_SESSION['user_id']]);
                $recent_orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
                
                if (empty($recent_orders)): ?>
                    <p>You have no recent orders.</p>
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
                                    <td><a href="/lushaka-urithi/seller/order_details.php?id=<?= $order['order_id'] ?>" class="btn-view">View</a></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                    <a href="/lushaka-urithi/seller/dashboard.php?tab=orders" class="btn-view-all">View All Orders</a>
                <?php endif; ?>
            </div>
            
        <?php elseif ($tab === 'products'): ?>
            <div class="products-header">
                <h2>My Products</h2>
                <a href="/lushaka-urithi/seller/add_product.php" class="btn btn-primary">Add New Product</a>
            </div>
            
            <?php if (empty($products)): ?>
                <div class="empty-state">
                    <i class="fas fa-tshirt"></i>
                    <p>You haven't listed any products yet.</p>
                    <a href="/lushaka-urithi/seller/add_product.php" class="btn">Add Your First Product</a>
                </div>
            <?php else: ?>
                <table class="products-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Stock</th>
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
                                <td class="product-info">
                                    <img src="/lushaka-urithi/assets/uploads/products/<?= $main_image ?>" alt="<?= $product['name'] ?>">
                                    <div>
                                        <h4><?= $product['name'] ?></h4>
                                        <p><?= $product['cultural_origin'] ?></p>
                                    </div>
                                </td>
                                <td><?= $product['category_name'] ?></td>
                                <td>R <?= number_format($product['price'], 2) ?></td>
                                <td><?= $product['quantity'] ?></td>
                                <td><span class="status-badge <?= $product['status'] ?>"><?= ucfirst($product['status']) ?></span></td>
                                <td class="actions">
                                    <a href="/lushaka-urithi/product.php?id=<?= $product['product_id'] ?>" class="btn-view" target="_blank">View</a>
                                    <a href="/lushaka-urithi/seller/edit_product.php?id=<?= $product['product_id'] ?>" class="btn-edit">Edit</a>
                                    <a href="/lushaka-urithi/seller/delete_product.php?id=<?= $product['product_id'] ?>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
            
        <?php elseif ($tab === 'orders'): ?>
            <h2>Orders</h2>
            
            <?php if (empty($orders)): ?>
                <div class="empty-state">
                    <i class="fas fa-shopping-bag"></i>
                    <p>You have no orders yet.</p>
                </div>
            <?php else: ?>
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Order #</th>
                            <th>Buyer</th>
                            <th>Date</th>
                            <th>Items</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($orders as $order): 
                            // Count items in order from this seller
                            $stmt = $pdo->prepare("SELECT COUNT(*) as item_count 
                                                   FROM order_items oi 
                                                   JOIN products p ON oi.product_id = p.product_id 
                                                   WHERE oi.order_id = ? AND p.seller_id = ?");
                            $stmt->execute([$order['order_id'], $_SESSION['user_id']]);
                            $item_count = $stmt->fetch(PDO::FETCH_ASSOC)['item_count'];
                            
                            // Calculate total for this seller's items in the order
                            $stmt = $pdo->prepare("SELECT SUM(oi.price * oi.quantity) as seller_total 
                                                   FROM order_items oi 
                                                   JOIN products p ON oi.product_id = p.product_id 
                                                   WHERE oi.order_id = ? AND p.seller_id = ?");
                            $stmt->execute([$order['order_id'], $_SESSION['user_id']]);
                            $seller_total = $stmt->fetch(PDO::FETCH_ASSOC)['seller_total'];
                        ?>
                            <tr>
                                <td>#<?= str_pad($order['order_id'], 6, '0', STR_PAD_LEFT) ?></td>
                                <td><?= $order['buyer_name'] ?></td>
                                <td><?= date('M j, Y', strtotime($order['order_date'])) ?></td>
                                <td><?= $item_count ?> item<?= $item_count != 1 ? 's' : '' ?></td>
                                <td>R <?= number_format($seller_total, 2) ?></td>
                                <td><span class="status-badge <?= $order['status'] ?>"><?= ucfirst($order['status']) ?></span></td>
                                <td><a href="/lushaka-urithi/seller/order_details.php?id=<?= $order['order_id'] ?>" class="btn-view">View</a></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
            
        <?php elseif ($tab === 'messages'): ?>
            <h2>Messages</h2>
			
            <?php
if (isset($_GET['upload']) && $_GET['upload'] == 'success') {
    echo "<p style='color: green;'>Product uploaded successfully!</p>";
}
?>

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
                            <a href="/lushaka-urithi/seller/message.php?id=<?= $message['message_id'] ?>" class="btn-view-message">View Message</a>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
            
        <?php elseif ($tab === 'reviews'): ?>
            <h2>Product Reviews</h2>
            
            <?php if (empty($reviews)): ?>
                <div class="empty-state">
                    <i class="fas fa-star"></i>
                    <p>You have no reviews yet.</p>
                </div>
            <?php else: ?>
                <div class="reviews-list">
                    <?php foreach ($reviews as $review): ?>
                        <div class="review">
                            <div class="reviewer-info">
                                <img src="/lushaka-urithi/assets/uploads/profile_pics/<?= $review['profile_pic'] ?? 'default.jpg' ?>" alt="<?= $review['reviewer_name'] ?>">
                                <div>
                                    <h4><?= $review['reviewer_name'] ?></h4>
                                    <div class="rating">
                                        <?php for ($i = 1; $i <= 5; $i++): ?>
                                            <i class="fas fa-star <?= $i <= $review['rating'] ? 'filled' : '' ?>"></i>
                                        <?php endfor; ?>
                                        <span class="review-date"><?= date('M j, Y', strtotime($review['review_date'])) ?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="review-content">
                                <h5>Product: <?= $review['product_name'] ?></h5>
                                <p><?= nl2br(htmlspecialchars($review['review_text'])) ?></p>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        <?php endif; ?>
    </div>
</section>

<?php require_once(__DIR__ . '/../templates/footer.php'); ?>