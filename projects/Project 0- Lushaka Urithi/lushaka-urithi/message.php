<?php
require_once 'templates/header.php';

if (!$isLoggedIn) {
    header("Location: /lushaka-urithi/login.php");
    exit();
}

$message_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$seller_id = isset($_GET['seller_id']) ? (int)$_GET['seller_id'] : 0;
$product_id = isset($_GET['product_id']) ? (int)$_GET['product_id'] : null;
$subject = isset($_GET['subject']) ? urldecode($_GET['subject']) : '';

// Fetch message if viewing existing one
if ($message_id > 0) {
    $stmt = $pdo->prepare("SELECT m.*, u.username as sender_name, u.user_id as sender_id, 
                          p.name as product_name, p.product_id
                          FROM messages m
                          JOIN users u ON m.sender_id = u.user_id
                          LEFT JOIN products p ON m.product_id = p.product_id
                          WHERE m.message_id = ? AND (m.sender_id = ? OR m.receiver_id = ?)");
    $stmt->execute([$message_id, $_SESSION['user_id'], $_SESSION['user_id']]);
    $message = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$message) {
        header("Location: /lushaka-urithi/account.php?tab=messages");
        exit();
    }
    
    // Set conversation participants
    if ($message['sender_id'] == $_SESSION['user_id']) {
        $receiver_id = $message['receiver_id'];
    } else {
        $receiver_id = $message['sender_id'];
        $product_id = $message['product_id'];
    }
} 
// New message to seller
elseif ($seller_id > 0) {
    $stmt = $pdo->prepare("SELECT user_id, username FROM users WHERE user_id = ? AND user_type = 'seller'");
    $stmt->execute([$seller_id]);
    $seller = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$seller) {
        header("Location: /lushaka-urithi/");
        exit();
    }
    
    $receiver_id = $seller['user_id'];
    
    // If product is specified, get product details
    if ($product_id) {
        $stmt = $pdo->prepare("SELECT name FROM products WHERE product_id = ?");
        $stmt->execute([$product_id]);
        $product = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($product) {
            $subject = "Regarding product: " . $product['name'];
        }
    }
} 
// Invalid request
else {
    header("Location: /lushaka-urithi/account.php?tab=messages");
    exit();
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['message'])) {
    $message_text = trim($_POST['message']);
    $subject = trim($_POST['subject']);
    $product_id = !empty($_POST['product_id']) ? (int)$_POST['product_id'] : null;
    
    if (empty($message_text)) {
        $error = "Please enter a message.";
    } else {
        // For replies, use original receiver as new sender
        $sender_id = $_SESSION['user_id'];
        $new_receiver_id = $receiver_id;
        
        // Insert message
        $stmt = $pdo->prepare("INSERT INTO messages (sender_id, receiver_id, product_id, subject, message) 
                              VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([
            $sender_id,
            $new_receiver_id,
            $product_id,
            $subject,
            $message_text
        ]);
        
        $_SESSION['success'] = "Message sent successfully!";
        header("Location: /lushaka-urithi/account.php?tab=messages");
        exit();
    }
}

// Fetch conversation history if viewing existing message
$conversation = [];
if (isset($message)) {
    $stmt = $pdo->prepare("SELECT m.*, u.username as sender_name, u.profile_pic 
                          FROM messages m
                          JOIN users u ON m.sender_id = u.user_id
                          WHERE ((m.sender_id = ? AND m.receiver_id = ?) OR 
                                (m.sender_id = ? AND m.receiver_id = ?))
                          AND (m.product_id = ? OR m.product_id IS NULL)
                          ORDER BY m.sent_date ASC");
    $stmt->execute([
        $message['sender_id'],
        $message['receiver_id'],
        $message['receiver_id'],
        $message['sender_id'],
        $message['product_id'] ?? null
    ]);
    $conversation = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch receiver info
$stmt = $pdo->prepare("SELECT user_id, username, profile_pic FROM users WHERE user_id = ?");
$stmt->execute([$receiver_id]);
$receiver = $stmt->fetch(PDO::FETCH_ASSOC);
?>

<section class="message-page">
    <div class="container">
        <div class="message-header">
            <a href="/lushaka-urithi/account.php?tab=messages" class="btn-back">
                <i class="fas fa-arrow-left"></i> Back to Messages
            </a>
            <h2>
                <?php if (isset($message)): ?>
                    Conversation with <?= $receiver['username'] ?>
                    <?php if ($message['product_id']): ?>
                        about <?= $message['product_name'] ?>
                    <?php endif; ?>
                <?php else: ?>
                    New Message to <?= $receiver['username'] ?>
                <?php endif; ?>
            </h2>
        </div>
        
        <?php if (isset($error)): ?>
            <div class="alert alert-danger"><?= $error ?></div>
        <?php endif; ?>
        
        <div class="message-conversation">
            <?php if (!empty($conversation)): ?>
                <?php foreach ($conversation as $msg): ?>
                    <div class="message-bubble <?= $msg['sender_id'] == $_SESSION['user_id'] ? 'sent' : 'received' ?>">
                        <div class="message-sender">
                            <img src="/lushaka-urithi/assets/uploads/profile_pics/<?= $msg['profile_pic'] ?? 'default.jpg' ?>" alt="<?= $msg['sender_name'] ?>">
                            <span><?= $msg['sender_name'] ?></span>
                            <small><?= date('M j, Y g:i a', strtotime($msg['sent_date'])) ?></small>
                        </div>
                        <?php if ($msg['subject']): ?>
                            <h4><?= $msg['subject'] ?></h4>
                        <?php endif; ?>
                        <div class="message-text">
                            <?= nl2br(htmlspecialchars($msg['message'])) ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
            
            <form action="/lushaka-urithi/message.php<?= $message_id ? '?id=' . $message_id : '' ?>" method="post" class="message-form">
                <?php if (!isset($message)): ?>
                    <div class="form-group">
                        <label for="subject">Subject:</label>
                        <input type="text" id="subject" name="subject" value="<?= htmlspecialchars($subject) ?>" required>
                    </div>
                    <?php if ($product_id): ?>
                        <input type="hidden" name="product_id" value="<?= $product_id ?>">
                    <?php endif; ?>
                <?php endif; ?>
                <div class="form-group">
                    <label for="message">Your Message:</label>
                    <textarea id="message" name="message" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Message</button>
            </form>
        </div>
    </div>
</section>

<?php require_once 'templates/footer.php'; ?>