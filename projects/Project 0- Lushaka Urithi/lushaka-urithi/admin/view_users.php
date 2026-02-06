<?php
session_start();
if (!isset($_SESSION['admin_id'])) {
    header("Location: admin_login.php");
    exit();
}

include '../config/db.php';
$result = $conn->query("SELECT * FROM users ORDER BY created_at DESC");
?>

<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>

    <h2>All Registered Users</h2>
    <p><a href="dashboard.php">← Back to Dashboard</a></p>
	
    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>User Type</th>
            <th>Registered At</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?= $row['id'] ?></td>
            <td><?= htmlspecialchars($row['full_name']) ?></td>
            <td><?= htmlspecialchars($row['email']) ?></td>
            <td><?= htmlspecialchars($row['role']) ?></td>
            <td><?= htmlspecialchars($row['user_type']) ?></td>
            <td><?= $row['created_at'] ?></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
