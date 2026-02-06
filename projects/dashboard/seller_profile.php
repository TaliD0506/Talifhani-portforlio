<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit();
}

include '../includes/db_connect.php';

$seller_id = $_SESSION['user_id'];

$stmt = $conn->prepare("SELECT full_name, email FROM users WHERE id = ?");
$stmt->bind_param("i", $seller_id);
$stmt->execute();
$stmt->bind_result($full_name, $email);
$stmt->fetch();
$stmt->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Seller Profile</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <h2>Your Profile</h2>
    <p><strong>Full Name:</strong> <?= htmlspecialchars($full_name) ?></p>
    <p><strong>Email:</strong> <?= htmlspecialchars($email) ?></p>

    <p><a href="edit_profile.php">Edit Profile</a></p>
    <p><a href="seller.php">← Back to Dashboard</a></p>
</body>
</html>
