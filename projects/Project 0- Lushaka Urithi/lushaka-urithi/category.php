<?php
require_once 'templates/header.php';

$category_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

$stmt = $pdo->prepare("SELECT * FROM categories WHERE category_id = ?");
$stmt->execute([$category_id]);
$category = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$category) {
    echo "<p>Category not found.</p>";
    require_once 'templates/footer.php';
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM products WHERE category_id = ? AND status = 'active'");
$stmt->execute([$category_id]);
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<section class="category-products">
    <h2>Products in <?= htmlspecialchars($category['name']) ?></h2>
    <div class="product-grid">
        <?php foreach ($products as $product): 
            $images = explode(',', $product['images']);
            $main_image = $images[0];
        ?>
            <div class="product-card">
                <a href="product.php?id=<?= $product['product_id'] ?>">
                    <img src="assets/images/products/<?= $main_image ?>" alt="<?= $product['name'] ?>">
                    <h3><?= $product['name'] ?></h3>
                    <p>R<?= $product['price'] ?></p>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
</section>
<?php require_once 'templates/footer.php'; ?>
