<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit();
}

require_once '../includes/db_connect.php'; // Make sure this path is correct

$seller_id = $_SESSION['user_id'];
$sql = "SELECT * FROM products WHERE seller_id = ? ORDER BY created_at DESC";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $seller_id);
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Seller Dashboard</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <h2>Welcome, <?= htmlspecialchars($_SESSION['full_name']) ?>!</h2>
    <p><a href="../logout.php">Logout</a> | <a href="upload_product.php">Upload Product</a></p>

    <h3>Your Uploaded Products</h3>
    <div style="display: flex; flex-wrap: wrap;">
        <?php while ($row = $result->fetch_assoc()) : ?>
            <div style="border:1px solid #ccc; padding:10px; margin:10px; width:200px;">
                <img src="../uploads/<?= htmlspecialchars($row['product_image']) ?>" width="180" height="180"><br>
                <strong><?= htmlspecialchars($row['product_name']) ?></strong><br>
                Category: <?= htmlspecialchars($row['product_category']) ?><br>
                Price: R<?= htmlspecialchars($row['product_price']) ?><br>
                <p><?= nl2br(htmlspecialchars($row['product_description'])) ?></p>
                <a href="edit_product.php?id=<?= $row['id'] ?>">✏️ Edit</a> |
                <a href="delete_product.php?id=<?= $row['id'] ?>" onclick="return confirm('Delete this product?')">🗑️ Delete</a>
            </div>
        <?php endwhile; ?>
    </div>
</body>
</html>
