<?php
session_start();
require_once '../includes/db_connect.php';

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $sender_id = $_SESSION['user_id']; // Seller replying
    $receiver_id = $_POST['receiver_id']; // Original buyer
    $message = trim($_POST['message']);

    if (!empty($message)) {
        $stmt = $conn->prepare("INSERT INTO messages (sender_id, receiver_id, message) VALUES (?, ?, ?)");
        $stmt->bind_param("iis", $sender_id, $receiver_id, $message);
        $stmt->execute();
        header("Location: inbox.php?reply_sent=1");
        exit();
    } else {
        echo "⚠️ Cannot send empty reply.";
    }
}
?>
