<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: admin_login.php");
    exit;
}

$sql = "SELECT id, full_name, email, user_type, created_at FROM users ORDER BY created_at DESC";
$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Users</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: left; }
        a.button { padding: 5px 10px; background: red; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>

<h2>Admin Dashboard</h2>
<p>Welcome, <?= htmlspecialchars($_SESSION['admin_username']) ?> | <a href="admin_logout.php">Logout</a></p>

<h3>Registered Users</h3>
<table>
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>User Type</th>
        <th>Registered At</th>
        <th>Action</th>
    </tr>
    <?php while ($user = mysqli_fetch_assoc($result)) : ?>
    <tr>
        <td><?= $user['id'] ?></td>
        <td><?= htmlspecialchars($user['full_name']) ?></td>
        <td><?= htmlspecialchars($user['email']) ?></td>
        <td><?= ucfirst($user['user_type']) ?></td>
        <td><?= $user['created_at'] ?></td>
        <td>
            <a class="button" href="delete_user.php?id=<?= $user['id'] ?>" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
        </td>
    </tr>
    <?php endwhile; ?>
</table>

</body>
</html>

