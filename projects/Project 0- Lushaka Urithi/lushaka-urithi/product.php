<?php
require_once 'templates/header.php';

if (!isset($_GET['id'])) {
    header("Location: /lushaka-urithi/products.php");
    exit();
}

$product_id = (int)$_GET['id'];

// Fetch product details
$stmt = $pdo->prepare("SELECT p.*, u.username as seller_name, u.user_id as seller_id, c.name as category_name 
                       FROM products p 
                       JOIN users u ON p.seller_id = u.user_id 
                       JOIN categories c ON p.category_id = c.category_id 
                       WHERE p.product_id = ? AND p.status = 'active'");
$stmt->execute([$product_id]);
$product = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$product) {
    header("Location: /lushaka-urithi/products.php");
    exit();
}

// Fetch product images
$images = explode(',', $product['images']);

// Fetch seller's other products
$stmt = $pdo->prepare("SELECT p.* FROM products p 
                       WHERE p.seller_id = ? AND p.status = 'active' AND p.product_id != ? 
                       LIMIT 4");
$stmt->execute([$product['seller_id'], $product_id]);
$seller_products = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch reviews
$stmt = $pdo->prepare("SELECT r.*, u.username as reviewer_name, u.profile_pic 
                       FROM reviews r 
                       JOIN users u ON r.reviewer_id = u.user_id 
                       WHERE r.product_id = ? 
                       ORDER BY r.review_date DESC");
$stmt->execute([$product_id]);
$reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Calculate average rating
$avg_rating = 0;
if (count($reviews) > 0) {
    $sum = 0;
    foreach ($reviews as $review) {
        $sum += $review['rating'];
    }
    $avg_rating = $sum / count($reviews);
}
?>

<section class="product-detail">
    <div class="product-gallery">
        <div class="main-image">
            <img src="/lushaka-urithi/assets/uploads/products/<?= $images[0] ?>" alt="<?= $product['name'] ?>" id="main-product-image">
        </div>
        <div class="thumbnail-container">
            <?php foreach ($images as $index => $image): ?>
                <img src="/lushaka-urithi/assets/uploads/products/<?= $image ?>" alt="<?= $product['name'] ?> - Image <?= $index + 1 ?>" class="thumbnail <?= $index === 0 ? 'active' : '' ?>" data-image="<?= $image ?>">
            <?php endforeach; ?>
        </div>
    </div>
    
    <div class="product-info">
        <h1><?= htmlspecialchars($product['name']) ?></h1>
        
        <div class="product-meta">
            <span class="price">R <?= number_format($product['price'], 2) ?></span>
            <span class="stock"><?= $product['quantity'] > 0 ? 'In Stock' : 'Out of Stock' ?></span>
            <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++): ?>
                    <i class="fas fa-star <?= $i <= round($avg_rating) ? 'filled' : '' ?>"></i>
                <?php endfor; ?>
                <span>(<?= count($reviews) ?> reviews)</span>
            </div>
        </div>
        
        <div class="product-seller">
            <h3>Sold by:</h3>
            <div class="seller-info">
                <img src="/lushaka-urithi/assets/uploads/profile_pics/<?= $product['profile_pic'] ?? 'default.jpg' ?>" alt="<?= $product['seller_name'] ?>">
                <a href="/lushaka-urithi/seller.php?id=<?= $product['seller_id'] ?>"><?= $product['seller_name'] ?></a>
            </div>
            <?php if ($isLoggedIn && $_SESSION['user_id'] != $product['seller_id']): ?>
                <button class="btn-contact-seller" data-seller-id="<?= $product['seller_id'] ?>" data-product-id="<?= $product['product_id'] ?>">Contact Seller</button>
            <?php endif; ?>
        </div>
        
        <div class="product-description">
            <h3>Description</h3>
            <p><?= nl2br(htmlspecialchars($product['description'])) ?></p>
        </div>
        
        <div class="product-details">
            <h3>Details</h3>
            <ul>
                <li><strong>Category:</strong> <?= $product['category_name'] ?></li>
                <li><strong>Cultural Origin:</strong> <?= $product['cultural_origin'] ?></li>
                <?php if (!empty($product['size'])): ?>
                    <li><strong>Size:</strong> <?= $product['size'] ?></li>
                <?php endif; ?>
                <?php if (!empty($product['color'])): ?>
                    <li><strong>Color:</strong> <?= $product['color'] ?></li>
                <?php endif; ?>
                <?php if (!empty($product['material'])): ?>
                    <li><strong>Material:</strong> <?= $product['material'] ?></li>
                <?php endif; ?>
                <li><strong>Listed on:</strong> <?= date('F j, Y', strtotime($product['listing_date'])) ?></li>
            </ul>
        </div>
        
        <?php if ($product['quantity'] > 0): ?>
            <div class="product-actions">
                <form action="/lushaka-urithi/includes/add_to_cart.php" method="post">
                    <input type="hidden" name="product_id" value="<?= $product['product_id'] ?>">
                    <div class="quantity-selector">
                        <label for="quantity">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1" max="<?= $product['quantity'] ?>">
                    </div>
                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                    <?php if ($isLoggedIn): ?>
                        <button type="button" class="btn btn-secondary btn-add-to-wishlist" data-product-id="<?= $product['product_id'] ?>">
                            <i class="far fa-heart"></i> Save
                        </button>
                    <?php endif; ?>
                </form>
            </div>
        <?php else: ?>
            <div class="out-of-stock">
                <p>This item is currently out of stock.</p>
                <button class="btn-notify-me" data-product-id="<?= $product['product_id'] ?>">Notify Me When Available</button>
            </div>
        <?php endif; ?>
    </div>
</section>

<section class="product-reviews">
    <h2>Customer Reviews</h2>
    
    <?php if ($isLoggedIn && $_SESSION['user_id'] != $product['seller_id']): ?>
        <div class="add-review">
            <h3>Write a Review</h3>
            <form action="/lushaka-urithi/includes/add_review.php" method="post">
                <input type="hidden" name="product_id" value="<?= $product['product_id'] ?>">
                <div class="rating-input">
                    <span>Your Rating:</span>
                    <div class="stars">
                        <?php for ($i = 5; $i >= 1; $i--): ?>
                            <input type="radio" id="star<?= $i ?>" name="rating" value="<?= $i ?>" <?= $i == 5 ? 'checked' : '' ?>>
                            <label for="star<?= $i ?>"><i class="fas fa-star"></i></label>
                        <?php endfor; ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="review_text">Your Review:</label>
                    <textarea id="review_text" name="review_text" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn">Submit Review</button>
            </form>
        </div>
    <?php endif; ?>
    
    <div class="reviews-list">
        <?php if (empty($reviews)): ?>
            <p>No reviews yet. Be the first to review this product!</p>
        <?php else: ?>
            <?php foreach ($reviews as $review): ?>
                <div class="review">
                    <div class="reviewer-info">
                        <img src="/lushaka-urithi/assets/uploads/profile_pics/<?= $review['profile_pic'] ?? 'default.jpg' ?>" alt="<?= $review['reviewer_name'] ?>">
                        <div>
                            <h4><?= $review['reviewer_name'] ?></h4>
                            <div class="rating">
                                <?php for ($i = 1; $i <= 5; $i++): ?>
                                    <i class="fas fa-star <?= $i <= $review['rating'] ? 'filled' : '' ?>"></i>
                                <?php endfor; ?>
                                <span class="review-date"><?= date('F j, Y', strtotime($review['review_date'])) ?></span>
                            </div>
                        </div>
                    </div>
                    <div class="review-content">
                        <p><?= nl2br(htmlspecialchars($review['review_text'])) ?></p>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</section>

<section class="related-products">
    <h2>More from this Seller</h2>
    <div class="product-grid">
        <?php foreach ($seller_products as $product): 
            $images = explode(',', $product['images']);
            $main_image = $images[0];
        ?>
            <div class="product-card">
                <a href="/lushaka-urithi/product.php?id=<?= $product['product_id'] ?>">
                    <img src="/lushaka-urithi/assets/uploads/products/<?= $main_image ?>" alt="<?= $product['name'] ?>">
                    <h3><?= $product['name'] ?></h3>
                    <p class="price">R <?= number_format($product['price'], 2) ?></p>
                </a>
                <button class="btn-add-to-cart" data-product-id="<?= $product['product_id'] ?>">Add to Cart</button>
            </div>
        <?php endforeach; ?>
    </div>
</section>

<script>
// Image gallery functionality
document.querySelectorAll('.thumbnail').forEach(thumb => {
    thumb.addEventListener('click', function() {
        document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
        this.classList.add('active');
        document.getElementById('main-product-image').src = '/lushaka-urithi/assets/uploads/products/' + this.dataset.image;
    });
});
</script>

<?php require_once 'templates/footer.php'; ?>