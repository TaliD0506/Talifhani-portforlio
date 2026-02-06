<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

$stmt = $conn->prepare("
    SELECT m.id, m.message, m.sent_at, u.full_name AS sender_name
    FROM messages m
    JOIN users u ON m.sender_id = u.id
    WHERE m.receiver_id = ?
    ORDER BY m.sent_at DESC
");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$messages = $stmt->get_result();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Seller Inbox</title>
</head>
<body>
    <h2>📬 Messages from Buyers</h2>
    <p><a href="seller.php">🔙 Back to Dashboard</a> | <a href="../logout.php">Logout</a></p>

    <?php if ($messages->num_rows > 0): ?>
        <?php while ($row = $messages->fetch_assoc()): ?>
    <div style="border:1px solid #ccc; padding:10px; margin:10px;">
        <strong>From:</strong> <?= htmlspecialchars($row['sender_name']) ?><br>
        <strong>Message:</strong> <?= nl2br(htmlspecialchars($row['message'])) ?><br>
        <small>Sent: <?= $row['sent_at'] ?></small>

        <!-- Reply Form -->
        <form method="post" action="reply_message.php">
            <input type="hidden" name="receiver_id" value="<?= $row['sender_id'] ?>">
            <textarea name="message" placeholder="Type your reply..." required></textarea><br>
            <button type="submit">📤 Reply</button>
        </form>
    </div>
<?php endwhile; ?>
    <?php else: ?>
        <p>No messages yet.</p>
    <?php endif; ?>
</body>
</html>
