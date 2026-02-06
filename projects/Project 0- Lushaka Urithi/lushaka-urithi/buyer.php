<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'buyer') {
    header("Location: ../login.php");
    exit();
}

require_once '../includes/db_connect.php';

$sql = "SELECT * FROM products ORDER BY created_at DESC";
$result = mysqli_query($conn, $sql);
$where = [];
$params = [];
$types = "";

if (!empty($_GET['search'])) {
    $where[] = "product_name LIKE ?";
    $params[] = '%' . $_GET['search'] . '%';
    $types .= "s";
}

if (!empty($_GET['category'])) {
    $where[] = "product_category = ?";
    $params[] = $_GET['category'];
    $types .= "s";
}

if (!empty($_GET['culture'])) {
    $where[] = "product_culture = ?";
    $params[] = $_GET['culture'];
    $types .= "s";
}

$query = "SELECT * FROM products";
if ($where) {
    $query .= " WHERE " . implode(" AND ", $where);
}

$query .= " ORDER BY created_at DESC";

$stmt = $conn->prepare($query);
if ($params) {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$result = $stmt->get_result();

?>

<!DOCTYPE html>
<html>
<head>
    <title>Buyer Dashboard</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <h2>Welcome, Buyer!</h2>
    <p><a href="../logout.php">Logout</a></p>
	<form method="get" action="buyer.php"> <input type="text" name="search" placeholder="Search products...">

    <select name="category">
        <option value="">All Categories</option>
        <option value="Dress">Dress</option>
        <option value="Shirt">Shirt</option>
        <option value="Accessories">Accessories</option>
		<option value="Men">Men</option>
	    <option value="Women">Women</option>
    </select>

    <select name="culture">
        <option value="">All Cultures</option>
        <option value="Zulu">Zulu</option>
        <option value="Xhosa">Xhosa</option>
        <option value="Venda">Venda</option>
        <option value="Tswana">Tswana</option>
        <option value="Sotho">Sotho</option>
        <option value="Swati">Swati</option>
        <option value="Tsonga">Tsonga</option>
        <option value="Ndebele">Ndebele</option>
        <option value="Pedi">Pedi</option>
		  <option value="Others">Others</option>
    </select>

    <input type="submit" value="Filter">
</form>

    <h3>All Products</h3>
    <div style="display: flex; flex-wrap: wrap;">
        <?php while ($row = mysqli_fetch_assoc($result)) : ?>
            <div style="border:1px solid #ccc; padding:10px; margin:10px; width:200px;">
                <img src="../uploads/<?= htmlspecialchars($row['product_image']) ?>" width="180" height="180"><br>
                <strong><?= htmlspecialchars($row['product_name']) ?></strong><br>
                Category: <?= htmlspecialchars($row['product_category']) ?><br>
                Price: R<?= htmlspecialchars($row['product_price']) ?><br>
                <p><?= nl2br(htmlspecialchars($row['product_description'])) ?></p>
				<form method="post" action="add_to_cart.php">
    <input type="hidden" name="product_id" value="<?= $row['id'] ?>">
    <button type="submit">Add to Cart 🛒</button>
</form>
    <form method="post" action="send_message.php">
    <input type="hidden" name="seller_id" value="<?= $row['seller_id'] ?>">
    <textarea name="message" placeholder="Ask the seller..." required></textarea>
    <button type="submit">📩 Send Message</button>
</form>
<form method="post" action="place_order.php">
    <input type="hidden" name="product_id" value="<?= $row['id'] ?>">
    <input type="hidden" name="seller_id" value="<?= $row['seller_id'] ?>">
    <button type="submit">🛒 Order Now</button>
</form>

            </div>
        <?php endwhile; ?>
    </div>
</body>
</html>


