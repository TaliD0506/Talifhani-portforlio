<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'seller') {
    header("Location: ../login.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Upload Product</title>
</head>
<body>
    <h2>Upload New Product</h2>
    <form action="upload_product_action.php" method="POST" enctype="multipart/form-data">
        <label>Product Name:</label><br>
        <input type="text" name="product_name" required><br><br>

        <label>Description:</label><br>
        <textarea name="description" required></textarea><br><br>

        <label>Category:</label><br>
        <select name="category">
            <option value="Venda">Venda</option>
            <option value="Zulu">Zulu</option>
            <option value="Xhosa">Xhosa</option>
            <option value="Sotho">Sotho</option>
            <option value="Swazi">Swazi</option>
            <option value="Tsonga">Tsonga</option>
            <option value="Tswana">Tswana</option>
            <option value="Ndebele">Ndebele</option>
            <option value="Pedi">Pedi</option>
            <option value="Other">Other</option>

        </select><br><br>

        <label>Upload Image:</label><br>
        <input type="file" name="product_image" accept="image/*" required><br><br>

        <input type="submit" value="Upload Product">
    </form>
</body>
</html>
