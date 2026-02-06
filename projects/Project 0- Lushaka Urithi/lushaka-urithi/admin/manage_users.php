<?php
session_start();
if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: admin_login.php");
    exit();
}

require_once '../includes/db_connect.php';

$sql = "SELECT id, full_name, email, user_type, created_at FROM users ORDER BY created_at DESC";
$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <h2>👤 All Registered Users</h2>
    <p><a href="dashboard.php">← Back to Dashboard</a></p>
    <table border="1" cellpadding="10">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>User Type</th>
            <th>Registered On</th>
            <th>Action</th>
        </tr>

        <?php while ($row = mysqli_fetch_assoc($result)) : ?>
        <tr>
            <td><?= $row['id'] ?></td>
            <td><?= htmlspecialchars($row['full_name']) ?></td>
            <td><?= htmlspecialchars($row['email']) ?></td>
            <td><?= htmlspecialchars($row['user_type']) ?></td>
            <td><?= $row['created_at'] ?></td>
            <td>
                <a href="delete_user.php?id=<?= $row['id'] ?>" onclick="return confirm('Are you sure you want to delete this user?')">❌ Delete</a>
            </td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
