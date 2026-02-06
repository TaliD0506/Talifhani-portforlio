<?php

require_once 'templates/header.php';



// Fetch featured products
$stmt = $pdo->query("SELECT p.*, u.username as seller_name 
                     FROM products p 
                     JOIN users u ON p.seller_id = u.user_id 
                     WHERE p.status = 'active' 
                     ORDER BY p.listing_date DESC 
                     LIMIT 8");
$featured_products = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch categories
$stmt = $pdo->query("SELECT * FROM categories ORDER BY name");
$categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<section class="hero">
    <div class="hero-content">
        <h1>Discover Authentic South African Traditional Attire</h1>
        <p>Connect with local sellers and own a piece of our rich cultural heritage</p>
        <a href="/lushaka-urithi/categories.php" class="btn btn-primary">Shop Now</a>
        <?php if (!$isLoggedIn || $userType === 'buyer'): ?>
            <a href="/lushaka-urithi/register.php?user_type=seller" class="btn btn-secondary">Become a Seller</a>
        <?php endif; ?>
    </div>
</section>

<section class="categories">
    <h2>Shop by Culture</h2>
    <div class="category-grid">
        <?php foreach ($categories as $category): ?>
            <div class="category-card">
                <a href="/lushaka-urithi/category.php?id=<?= $category['category_id'] ?>">
                    <img src="/lushaka-urithi/assets/images/categories/<?= $category['image'] ?>" alt="<?= $category['name'] ?>">
                    <h3><?= $category['name'] ?></h3>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
</section>

<section class="featured-products">
    <h2>New Arrivals</h2>
    <div class="product-grid">
        <?php foreach ($featured_products as $product): 
            $images = explode(',', $product['images']);
            $main_image = $images[0];
        ?>
            <div class="product-card">
                <a href="/lushaka-urithi/product.php?id=<?= $product['product_id'] ?>">
                    <img src="/lushaka-urithi/assets/uploads/products/<?= $main_image ?>" alt="<?= $product['name'] ?>">
                    <h3><?= $product['name'] ?></h3>
                    <p class="price">R <?= number_format($product['price'], 2) ?></p>
                    <p class="seller">By <?= $product['seller_name'] ?></p>
                    <p class="origin"><?= $product['cultural_origin'] ?></p>
                </a>
                <button class="btn-add-to-cart" data-product-id="<?= $product['product_id'] ?>">Add to Cart</button>
            </div>
        <?php endforeach; ?>
    </div>
</section>

<section class="testimonials">
    <h2>What Our Community Says</h2>
    <div class="testimonial-slider">
        <!-- Testimonials would be loaded here via JavaScript -->
    </div>
</section>

<section class="call-to-action">
    <div class="cta-content">
        <h2>Ready to Start Selling?</h2>
        <p>Join our marketplace and connect with buyers who appreciate authentic South African traditional clothing.</p>
        <a href="/lushaka-urithi/register.php?user_type=seller" class="btn btn-primary">Become a Seller</a>
    </div>
</section>

<?php require_once 'templates/footer.php'; ?>
