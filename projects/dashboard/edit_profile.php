<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit();
}

include '../includes/db_connect.php';

$seller_id = $_SESSION['user_id'];

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $full_name = $_POST['full_name'];
    $email = $_POST['email'];

    $stmt = $conn->prepare("UPDATE users SET full_name = ?, email = ? WHERE id = ?");
    $stmt->bind_param("ssi", $full_name, $email, $seller_id);
    if ($stmt->execute()) {
        $_SESSION['full_name'] = $full_name;
        header("Location: seller_profile.php");
        exit();
    } else {
        echo "❌ Update failed.";
    }
}

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
    <title>Edit Profile</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <h2>Edit Profile</h2>
    <form method="post" action="">
        <label>Full Name</label><br>
        <input type="text" name="full_name" value="<?= htmlspecialchars($full_name) ?>" required><br><br>
        
        <label>Email</label><br>
        <input type="email" name="email" value="<?= htmlspecialchars($email) ?>" required><br><br>
        
        <button type="submit">Save Changes</button>
    </form>
    <p><a href="seller_profile.php">← Cancel</a></p>
</body>
</html>
