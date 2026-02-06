<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit();
}

$seller_id = $_SESSION['user_id'];
$result = $conn->query("SELECT orders.*, users.full_name AS buyer_name, products.product_name 
                        FROM orders 
                        JOIN users ON orders.buyer_id = users.id 
                        JOIN products ON orders.product_id = products.id 
                        WHERE orders.seller_id = $seller_id 
                        ORDER BY ordered_at DESC");
?>

<!DOCTYPE html>
<html>
<head><title>Seller Orders</title></head>
<body>
<h2>Orders</h2>
<a href="seller.php">🔙 Dashboard</a> | <a href="../logout.php">Logout</a><br><br>

<?php while($row = $result->fetch_assoc()): ?>
    <div style="border:1px solid #ccc; padding:10px; margin:10px;">
        <strong>Buyer:</strong> <?= htmlspecialchars($row['buyer_name']) ?><br>
        <strong>Product:</strong> <?= htmlspecialchars($row['product_name']) ?><br>
        <strong>Status:</strong> <?= $row['status'] ?><br>
        <strong>Ordered at:</strong> <?= $row['ordered_at'] ?><br>

        <?php if ($row['status'] === 'pending'): ?>
            <form method="post" action="update_order.php">
                <input type="hidden" name="order_id" value="<?= $row['id'] ?>">
                <button name="status" value="accepted">✅ Accept</button>
                <button name="status" value="rejected">❌ Reject</button>
            </form>
        <?php endif; ?>
    </div>
<?php endwhile; ?>
</body>
</html>
