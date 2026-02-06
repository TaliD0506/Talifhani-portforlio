<?php
require_once 'templates/header.php';

// Get search parameters
$search_query = isset($_GET['q']) ? trim($_GET['q']) : '';
$category_id = isset($_GET['category']) ? (int)$_GET['category'] : 0;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$limit = 12;
$offset = ($page - 1) * $limit;

// Build query
$sql = "SELECT p.*, u.username as seller_name 
        FROM products p 
        JOIN users u ON p.seller_id = u.user_id 
        WHERE p.status = 'active'";
$params = [];

if (!empty($search_query)) {
    $sql .= " AND (p.name LIKE ? OR p.description LIKE ? OR p.cultural_origin LIKE ?)";
    $search_param = "%$search_query%";
    $params = array_merge($params, [$search_param, $search_param, $search_param]);
}

if ($category_id > 0) {
    $sql .= " AND p.category_id = ?";
    $params[] = $category_id;
}

// Count total products for pagination
$count_sql = "SELECT COUNT(*) as total FROM (" . $sql . ") as total_query";
$stmt = $pdo->prepare($count_sql);
$stmt->execute($params);
$total_products = $stmt->fetch(PDO::FETCH_ASSOC)['total'];
$total_pages = ceil($total_products / $limit);

// Add sorting and pagination
$sort = isset($_GET['sort']) ? $_GET['sort'] : 'newest';
switch ($sort) {
    case 'price_low':
        $sql .= " ORDER BY p.price ASC";
        break;
    case 'price_high':
        $sql .= " ORDER BY p.price DESC";
        break;
    case 'popular':
        // This would require a more complex query with review/order counts
        $sql .= " ORDER BY p.listing_date DESC";
        break;
    default:
        $sql .= " ORDER BY p.listing_date DESC";
}

$sql .= " LIMIT $limit OFFSET $offset";

// Fetch products
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<section class="product-listing">
    <div class="listing-header">
        <h2>
            <?php 
            if ($category_id > 0) {
                $stmt = $pdo->prepare("SELECT name FROM categories WHERE category_id = ?");
                $stmt->execute([$category_id]);
                $category = $stmt->fetch(PDO::FETCH_ASSOC);
                echo "Products in " . htmlspecialchars($category['name']);
            } elseif (!empty($search_query)) {
                echo "Search Results for \"" . htmlspecialchars($search_query) . "\"";
            } else {
                echo "All Products";
            }
            ?>
        </h2>
        <div class="sort-options">
            <span>Sort by:</span>
            <a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'newest'])) ?>" class="<?= $sort === 'newest' ? 'active' : '' ?>">Newest</a>
            <a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'price_low'])) ?>" class="<?= $sort === 'price_low' ? 'active' : '' ?>">Price: Low to High</a>
            <a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'price_high'])) ?>" class="<?= $sort === 'price_high' ? 'active' : '' ?>">Price: High to Low</a>
            <a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'popular'])) ?>" class="<?= $sort === 'popular' ? 'active' : '' ?>">Most Popular</a>
        </div>
    </div>

    <?php if (empty($products)): ?>
        <div class="no-results">
            <p>No products found matching your criteria.</p>
            <!-- Fixed: Clear all search parameters to show all products -->
            <a href="/lushaka-urithi/products.php" class="btn btn-primary">Browse All Products</a>
            
            <?php if (!empty($search_query) || $category_id > 0): ?>
                <div class="search-suggestions">
                    <p>Try:</p>
                    <ul>
                        <li><a href="/lushaka-urithi/products.php">View all products</a></li>
                        <?php if (!empty($search_query)): ?>
                            <li><a href="/lushaka-urithi/products.php?q=<?= urlencode($search_query) ?>">Search without category filter</a></li>
                        <?php endif; ?>
                        <?php if ($category_id > 0): ?>
                            <li><a href="/lushaka-urithi/products.php?category=<?= $category_id ?>">View category without search</a></li>
                        <?php endif; ?>
                    </ul>
                </div>
            <?php endif; ?>
        </div>
    <?php else: ?>
        <div class="products-found">
            <p>Showing <?= count($products) ?> of <?= $total_products ?> products</p>
        </div>
        
        <div class="product-grid">
            <?php foreach ($products as $product): 
                $images = explode(',', $product['images']);
                $main_image = $images[0];
            ?>
                <div class="product-card">
                    <a href="/lushaka-urithi/product.php?id=<?= $product['product_id'] ?>">
                        <div class="product-image">
                            <img src="/lushaka-urithi/assets/uploads/products/<?= htmlspecialchars($main_image) ?>" 
                                 alt="<?= htmlspecialchars($product['name']) ?>"
                                 onerror="this.src='/lushaka-urithi/assets/images/no-image.jpg';">
                        </div>
                        <div class="product-info">
                            <h3><?= htmlspecialchars($product['name']) ?></h3>
                            <p class="price">R <?= number_format($product['price'], 2) ?></p>
                            <p class="seller">By <?= htmlspecialchars($product['seller_name']) ?></p>
                            <p class="origin"><?= htmlspecialchars($product['cultural_origin']) ?></p>
                        </div>
                    </a>
                    <div class="product-actions">
                        <button class="btn btn-add-to-cart" data-product-id="<?= $product['product_id'] ?>">
                            Add to Cart
                        </button>
                        <?php if ($isLoggedIn): ?>
                            <button class="btn btn-add-to-wishlist" data-product-id="<?= $product['product_id'] ?>">
                                <i class="far fa-heart"></i>
                            </button>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <?php if ($total_pages > 1): ?>
            <div class="pagination">
                <?php if ($page > 1): ?>
                    <a href="?<?= http_build_query(array_merge($_GET, ['page' => $page - 1])) ?>" class="pagination-btn">&laquo; Previous</a>
                <?php endif; ?>

                <?php 
                // Show pagination numbers with ellipsis for large page counts
                $start = max(1, $page - 2);
                $end = min($total_pages, $page + 2);
                
                if ($start > 1): ?>
                    <a href="?<?= http_build_query(array_merge($_GET, ['page' => 1])) ?>" class="pagination-btn">1</a>
                    <?php if ($start > 2): ?>
                        <span class="pagination-ellipsis">...</span>
                    <?php endif; ?>
                <?php endif; ?>

                <?php for ($i = $start; $i <= $end; $i++): ?>
                    <a href="?<?= http_build_query(array_merge($_GET, ['page' => $i])) ?>" 
                       class="pagination-btn <?= $i === $page ? 'active' : '' ?>"><?= $i ?></a>
                <?php endfor; ?>

                <?php if ($end < $total_pages): ?>
                    <?php if ($end < $total_pages - 1): ?>
                        <span class="pagination-ellipsis">...</span>
                    <?php endif; ?>
                    <a href="?<?= http_build_query(array_merge($_GET, ['page' => $total_pages])) ?>" class="pagination-btn"><?= $total_pages ?></a>
                <?php endif; ?>

                <?php if ($page < $total_pages): ?>
                    <a href="?<?= http_build_query(array_merge($_GET, ['page' => $page + 1])) ?>" class="pagination-btn">Next &raquo;</a>
                <?php endif; ?>
            </div>
        <?php endif; ?>
    <?php endif; ?>
</section>

<!-- Additional Features -->
<section class="product-filters" style="margin-bottom: 20px;">
    <div class="filter-bar">
        <div class="active-filters">
            <?php if (!empty($search_query)): ?>
                <span class="filter-tag">
                    Search: "<?= htmlspecialchars($search_query) ?>"
                    <a href="?<?= http_build_query(array_diff_key($_GET, ['q' => ''])) ?>">×</a>
                </span>
            <?php endif; ?>
            
            <?php if ($category_id > 0): ?>
                <?php 
                $stmt = $pdo->prepare("SELECT name FROM categories WHERE category_id = ?");
                $stmt->execute([$category_id]);
                $category = $stmt->fetch(PDO::FETCH_ASSOC);
                ?>
                <span class="filter-tag">
                    Category: <?= htmlspecialchars($category['name']) ?>
                    <a href="?<?= http_build_query(array_diff_key($_GET, ['category' => ''])) ?>">×</a>
                </span>
            <?php endif; ?>
            
            <?php if (!empty($search_query) || $category_id > 0): ?>
                <a href="/lushaka-urithi/products.php" class="clear-filters">Clear All Filters</a>
            <?php endif; ?>
        </div>
    </div>
</section>

<?php require_once 'templates/footer.php'; ?>