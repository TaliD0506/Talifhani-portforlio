<?php
require_once '../templates/header.php';

// Database configuration
$host = "localhost"; // Change if necessary
$db_name = "your_database_name"; // Replace with your database name
$username = "your_username"; // Replace with your database username
$password = "your_password"; // Replace with your database password

// Create a connection
$conn = new mysqli($host, $username, $password, $db_name);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the order ID from the URL parameter
$order_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Prepare and execute the SQL statement
$sql = "SELECT * FROM orders WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $order_id);
$stmt->execute();
$result = $stmt->get_result();

// Check if an order was found
if ($result->num_rows > 0) {
    // Fetch order details
    $order = $result->fetch_assoc();
    ?>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details</title>
    </head>
    <body>
        <h1>Order Details</h1>
        <p><strong>Order ID:</strong> <?php echo htmlspecialchars($order['id']); ?></p>
        <p><strong>Customer Name:</strong> <?php echo htmlspecialchars($order['customer_name']); ?></p>
        <p><strong>Product:</strong> <?php echo htmlspecialchars($order['product']); ?></p>
        <p><strong>Quantity:</strong> <?php echo htmlspecialchars($order['quantity']); ?></p>
        <p><strong>Total Price:</strong> $<?php echo htmlspecialchars($order['total_price']); ?></p>
        <p><strong>Status:</strong> <?php echo htmlspecialchars($order['status']); ?></p>
    </body>
    </html>

    <?php
} else {
    echo "<p>No order found with ID: $order_id</p>";
}

// Close the connection
$stmt->close();
$conn->close();

require_once("../templates/footer.php");
?>
