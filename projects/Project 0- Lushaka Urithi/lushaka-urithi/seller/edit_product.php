<?php
require_once("../templates/header.php");

// Redirect if not a seller
if ($userType !== 'seller') {
    header("Location: /lushaka-urithi/");
    exit();
}

if (!isset($_GET['id'])) {
    header("Location: /lushaka-urithi/seller/dashboard.php?tab=products");
    exit();
}

$product_id = (int)$_GET['id'];

// Fetch product details
$stmt = $pdo->prepare("SELECT * FROM products WHERE product_id = ? AND seller_id = ?");
$stmt->execute([$product_id, $_SESSION['user_id']]);
$product = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$product) {
    header("Location: /lushaka-urithi/seller/dashboard.php?tab=products");
    exit();
}

// Fetch categories
$stmt = $pdo->query("SELECT * FROM categories ORDER BY name");
$categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $category_id = (int)$_POST['category_id'];
    $description = trim($_POST['description']);
    $cultural_origin = trim($_POST['cultural_origin']);
    $price = (float)$_POST['price'];
    $quantity = (int)$_POST['quantity'];
    $size = trim($_POST['size']);
    $color = trim($_POST['color']);
    $material = trim($_POST['material']);
    $status = $_POST['status'];
    
    // Handle image uploads
    $upload_dir = __DIR__ . '/../../assets/uploads/products/';
    $images = explode(',', $product['images']);
    
    // Process main image upload if provided
    if (isset($_FILES['main_image']) && $_FILES['main_image']['error'] === UPLOAD_ERR_OK) {
        $file_ext = pathinfo($_FILES['main_image']['name'], PATHINFO_EXTENSION);
        $file_name = uniqid('product_') . '.' . $file_ext;
        $upload_path = $upload_dir . $file_name;
        
        // Check file type and size
        $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
        $max_size = 5 * 1024 * 1024; // 5MB
        
        if (in_array($_FILES['main_image']['type'], $allowed_types)) {
            if ($_FILES['main_image']['size'] <= $max_size) {
                if (move_uploaded_file($_FILES['main_image']['tmp_name'], $upload_path)) {
                    // Delete old main image
                    if (file_exists($upload_dir . $images[0])) {
                        unlink($upload_dir . $images[0]);
                    }
                    $images[0] = $file_name;
                }
            }
        }
    }
    
    // Process additional images upload
    if (!empty($_FILES['additional_images']['name'][0])) {
        $new_images = [];
        
        foreach ($_FILES['additional_images']['tmp_name'] as $key => $tmp_name) {
            if ($_FILES['additional_images']['error'][$key] === UPLOAD_ERR_OK) {
                $file_ext = pathinfo($_FILES['additional_images']['name'][$key], PATHINFO_EXTENSION);
                $file_name = uniqid('product_') . '.' . $file_ext;
                $upload_path = $upload_dir . $file_name;
                
                if (in_array($_FILES['additional_images']['type'][$key], $allowed_types)) {
                    if ($_FILES['additional_images']['size'][$key] <= $max_size) {
                        if (move_uploaded_file($tmp_name, $upload_path)) {
                            $new_images[] = $file_name;
                        }
                    }
                }
            }
        }
        
        // Replace all images except main or append new ones
        if (isset($_POST['replace_images']) && $_POST['replace_images'] === '1') {
            // Delete old additional images
            for ($i = 1; $i < count($images); $i++) {
                if (file_exists($upload_dir . $images[$i])) {
                    unlink($upload_dir . $images[$i]);
                }
            }
            $images = array_merge([$images[0]], $new_images);
        } else {
            $images = array_merge($images, $new_images);
        }
    }
    
    // Handle image removal
    if (!empty($_POST['remove_images'])) {
        foreach ($_POST['remove_images'] as $image_index) {
            $image_index = (int)$image_index;
            if (isset($images[$image_index])) {
                if (file_exists($upload_dir . $images[$image_index])) {
                    unlink($upload_dir . $images[$image_index]);
                }
                unset($images[$image_index]);
            }
        }
        $images = array_values($images); // Reindex array
    }
    
    // Update product in database
    $images_str = implode(',', $images);
    
    $stmt = $pdo->prepare("UPDATE products SET 
                          name = ?, 
                          category_id = ?, 
                          description = ?, 
                          price = ?, 
                          quantity = ?, 
                          size = ?, 
                          color = ?, 
                          material = ?, 
                          cultural_origin = ?, 
                          images = ?, 
                          status = ?
                          WHERE product_id = ? AND seller_id = ?");
    
    $stmt->execute([
        $name,
        $category_id,
        $description,
        $price,
        $quantity,
        $size,
        $color,
        $material,
        $cultural_origin,
        $images_str,
        $status,
        $product_id,
        $_SESSION['user_id']
    ]);
    
    $_SESSION['success'] = "Product updated successfully!";
    header("Location: /lushaka-urithi/seller/dashboard.php?tab=products");
    exit();
}
?>

<section class="edit-product">
    <div class="container">
        <div class="page-header">
            <h1>Edit Product</h1>
            <a href="/lushaka-urithi/seller/dashboard.php?tab=products" class="btn-back">
                <i class="fas fa-arrow-left"></i> Back to Products
            </a>
        </div>
        
        <form action="/lushaka-urithi/seller/edit_product.php?id=<?= $product_id ?>" method="post" enctype="multipart/form-data">
            <div class="form-section">
                <h3>Product Information</h3>
                <div class="form-group">
                    <label for="name">Product Name:</label>
                    <input type="text" id="name" name="name" value="<?= htmlspecialchars($product['name']) ?>" required>
                </div>
                <div class="form-group">
                    <label for="category_id">Category:</label>
                    <select id="category_id" name="category_id" required>
                        <option value="">Select Category</option>
                        <?php foreach ($categories as $category): ?>
                            <option value="<?= $category['category_id'] ?>" <?= $category['category_id'] == $product['category_id'] ? 'selected' : '' ?>>
                                <?= $category['name'] ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" rows="5" required><?= htmlspecialchars($product['description']) ?></textarea>
                </div>
                <div class="form-group">
                    <label for="cultural_origin">Cultural Origin:</label>
                    <input type="text" id="cultural_origin" name="cultural_origin" value="<?= htmlspecialchars($product['cultural_origin']) ?>" required>
                    <small>e.g., Zulu, Xhosa, Sotho, etc.</small>
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select id="status" name="status" required>
                        <option value="active" <?= $product['status'] === 'active' ? 'selected' : '' ?>>Active</option>
                        <option value="sold" <?= $product['status'] === 'sold' ? 'selected' : '' ?>>Sold</option>
                        <option value="removed" <?= $product['status'] === 'removed' ? 'selected' : '' ?>>Removed</option>
                    </select>
                </div>
            </div>
            
            <div class="form-section">
                <h3>Pricing & Inventory</h3>
                <div class="form-group">
                    <label for="price">Price (R):</label>
                    <input type="number" id="price" name="price" min="0" step="0.01" value="<?= $product['price'] ?>" required>
                </div>
                <div class="form-group">
                    <label for="quantity">Quantity Available:</label>
                    <input type="number" id="quantity" name="quantity" min="0" value="<?= $product['quantity'] ?>" required>
                </div>
            </div>
            
            <div class="form-section">
                <h3>Product Details</h3>
                <div class="form-group">
                    <label for="size">Size (optional):</label>
                    <input type="text" id="size" name="size" value="<?= htmlspecialchars($product['size']) ?>">
                </div>
                <div class="form-group">
                    <label for="color">Color (optional):</label>
                    <input type="text" id="color" name="color" value="<?= htmlspecialchars($product['color']) ?>">
                </div>
                <div class="form-group">
                    <label for="material">Material (optional):</label>
                    <input type="text" id="material" name="material" value="<?= htmlspecialchars($product['material']) ?>">
                </div>
            </div>
            
            <div class="form-section">
                <h3>Product Images</h3>
                <div class="current-images">
                    <h4>Current Images</h4>
                    <div class="image-grid">
                        <?php 
                        $images = explode(',', $product['images']);
                        foreach ($images as $index => $image): 
                        ?>
                            <div class="image-item">
                                <img src="/lushaka-urithi/assets/uploads/products/<?= $image ?>" alt="Product Image <?= $index + 1 ?>">
                                <?php if ($index > 0): ?>
                                    <label class="remove-image">
                                        <input type="checkbox" name="remove_images[]" value="<?= $index ?>">
                                        Remove
                                    </label>
                                <?php endif; ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
                
                <div class="form-group">
                    <label>Update Main Image (optional):</label>
                    <input type="file" name="main_image" accept="image/*">
                </div>
                
                <div class="form-group">
                    <label>Additional Images (optional):</label>
                    <input type="file" name="additional_images[]" accept="image/*" multiple>
                    <small>Hold Ctrl/Cmd to select multiple images</small>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" name="replace_images" value="1">
                        Replace all existing additional images (except main image)
                    </label>
                </div>
            </div>
            
            <button type="submit" class="btn btn-primary">Update Product</button>
        </form>
    </div>
</section>

<?php require_once("../templates/header.php"); ?>