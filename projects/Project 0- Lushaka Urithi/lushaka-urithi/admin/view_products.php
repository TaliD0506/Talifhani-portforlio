<?php
session_start();
if (!isset($_SESSION['admin_id'])) {
    header("Location: admin_login.php");
    exit();
}
include '../config/db.php';
?>
<?php
$query = "
    SELECT p.*, u.full_name AS seller_name
    FROM products p
    JOIN users u ON p.seller_id = u.id
    ORDER BY p.created_at DESC
";
$result = $conn->query($query);
?>
<!DOCTYPE html>
<html>
<head>
    <title>All Products</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <h2>All Uploaded Products</h2>
    <p><a href="dashboard.php"> ← Back to Dashboard</a></p>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Seller</th>
            <th>Image</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price (R)</th>
            <th>Description</th>
            <th>Uploaded</th>
			<th>Action</th>

        </tr>
        <?php while ($row = $result->fetch_assoc()) : ?>
        <tr>
            <td><?= $row['id'] ?></td>
            <td><?= htmlspecialchars($row['seller_name']) ?></td>
            <td><img src="../uploads/<?= $row['product_image'] ?>" width="60" height="60"></td>
            <td><?= htmlspecialchars($row['product_name']) ?></td>
            <td><?= htmlspecialchars($row['product_category']) ?></td>
            <td><?= htmlspecialchars($row['product_price']) ?></td>
            <td><?= nl2br(htmlspecialchars($row['product_description'])) ?></td>
            <td><?= $row['created_at'] ?></td>
			<td>
    <a href="delete_product.php?id=<?= $row['id'] ?>" onclick="return confirm('Are you sure you want to delete this product?');">🗑️ Delete</a>
</td>

        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
