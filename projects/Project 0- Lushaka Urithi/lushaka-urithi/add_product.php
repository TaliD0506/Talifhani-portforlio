<?php
require_once(__DIR__ . '/../templates/header.php');


// Redirect if not a seller
if ($userType !== 'seller') {
    header("Location: /lushaka-urithi/");
    exit();
}

// Fetch categories for dropdown
$stmt = $pdo->query("SELECT * FROM categories ORDER BY name");
$categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<section class="add-product">
    <h2>Add New Product</h2>
    
<form action="includes/process_product.php" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="action" value="add">
        
        <div class="form-section">
            <h3>Product Information</h3>
            <div class="form-group">
                <label for="name">Product Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="category_id">Category:</label>
                <select id="category_id" name="category_id" required>
                    <option value="">Select Category</option>
                    <?php foreach ($categories as $category): ?>
                        <option value="<?= $category['category_id'] ?>"><?= $category['name'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="5" required></textarea>
            </div>
            <div class="form-group">
                <label for="cultural_origin">Cultural Origin:</label>
                <input type="text" id="cultural_origin" name="cultural_origin" required>
                <small>e.g., Zulu, Xhosa, Sotho, etc.</small>
            </div>
        </div>
        
        <div class="form-section">
            <h3>Pricing & Inventory</h3>
            <div class="form-group">
                <label for="price">Price (R):</label>
                <input type="number" id="price" name="price" min="0" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity Available:</label>
                <input type="number" id="quantity" name="quantity" min="1" value="1" required>
            </div>
        </div>
        
        <div class="form-section">
            <h3>Product Details</h3>
            <div class="form-group">
                <label for="size">Size (optional):</label>
                <input type="text" id="size" name="size">
            </div>
            <div class="form-group">
                <label for="color">Color (optional):</label>
                <input type="text" id="color" name="color">
            </div>
            <div class="form-group">
                <label for="material">Material (optional):</label>
                <input type="text" id="material" name="material">
            </div>
        </div>
        
        <div class="form-section">
        <h3>Product Images</h3>
        <div class="form-group">
            <label>Main Image (required):</label>
            <input type="file" name="main_image" accept="image/*" required>
        </div>
        <div class="form-group">
            <label>Additional Images (optional):</label>
            <input type="file" name="additional_images[]" accept="image/*" multiple>
            <small>Hold Ctrl/Cmd to select multiple images</small>
        </div>
    </div>
    
    <button type="submit" class="btn btn-primary">Add Product</button>
 </form>
</section>

<?php require_once(__DIR__ . '/../templates/footer.php'); ?>