<?php
require_once 'templates/header.php';

// Fetch sellers with their product counts and ratings
$stmt = $pdo->query("
    SELECT 
        u.user_id,
        u.username,
        u.email,
        u.phone,
        u.city,
        u.province,
        u.registration_date,
        COUNT(p.product_id) as product_count,
        AVG(r.rating) as avg_rating,
        COUNT(r.rating) as review_count
    FROM users u
    LEFT JOIN products p ON u.user_id = p.seller_id AND p.status = 'active'
    LEFT JOIN reviews r ON p.product_id = r.product_id
    WHERE u.user_type = 'seller'
    GROUP BY u.user_id
    ORDER BY product_count DESC, avg_rating DESC
");
$sellers = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Get search parameters
$search = isset($_GET['search']) ? trim($_GET['search']) : '';
$location = isset($_GET['location']) ? trim($_GET['location']) : '';
$sort = isset($_GET['sort']) ? $_GET['sort'] : 'products';

// Filter sellers based on search criteria
if ($search || $location) {
    $sql = "
        SELECT 
            u.user_id,
            u.username,
            u.email,
            u.phone,
            u.city,
            u.province,
            u.registration_date,
            COUNT(p.product_id) as product_count,
            AVG(r.rating) as avg_rating,
            COUNT(r.rating) as review_count
        FROM users u
        LEFT JOIN products p ON u.user_id = p.seller_id AND p.status = 'active'
        LEFT JOIN reviews r ON p.product_id = r.product_id
        WHERE u.user_type = 'seller'
    ";
    
    $params = [];
    
    if ($search) {
        $sql .= " AND u.username LIKE ?";
        $params[] = "%$search%";
    }
    
    if ($location) {
        $sql .= " AND (u.city LIKE ? OR u.province LIKE ?)";
        $params[] = "%$location%";
        $params[] = "%$location%";
    }
    
    $sql .= " GROUP BY u.user_id";
    
    // Add sorting
    switch ($sort) {
        case 'rating':
            $sql .= " ORDER BY avg_rating DESC, product_count DESC";
            break;
        case 'newest':
            $sql .= " ORDER BY u.registration_date DESC";
            break;
        case 'name':
            $sql .= " ORDER BY u.username ASC";
            break;
        default:
            $sql .= " ORDER BY product_count DESC, avg_rating DESC";
    }
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $sellers = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Get unique locations for filter dropdown
$location_stmt = $pdo->query("
    SELECT DISTINCT city, province 
    FROM users 
    WHERE user_type = 'seller' 
    AND city IS NOT NULL AND province IS NOT NULL
    ORDER BY province, city
");
$locations = $location_stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="hero-content text-center">
            <h1 class="hero-title">Meet Our Verified Sellers</h1>
            <p class="hero-subtitle">Discover talented artisans and businesses preserving South African traditional clothing heritage</p>
        </div>
    </div>
</section>

<!-- Filters Section -->
<section class="filters-section">
    <div class="container">
        <div class="card">
            <form method="GET" action="" class="filter-form">
                <div class="form-row">
                    <div class="form-group">
                        <input type="text" name="search" class="form-control" placeholder="Search sellers..." value="<?= htmlspecialchars($search) ?>">
                    </div>
                    
                    <div class="form-group">
                        <select name="location" class="form-control">
                            <option value="">All Locations</option>
                            <?php foreach ($locations as $loc): ?>
                                <option value="<?= htmlspecialchars($loc['city']) ?>" 
                                        <?= $location === $loc['city'] ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($loc['city']) ?>, <?= htmlspecialchars($loc['province']) ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <select name="sort" class="form-control">
                            <option value="products" <?= $sort === 'products' ? 'selected' : '' ?>>Most Products</option>
                            <option value="rating" <?= $sort === 'rating' ? 'selected' : '' ?>>Highest Rated</option>
                            <option value="newest" <?= $sort === 'newest' ? 'selected' : '' ?>>Newest Sellers</option>
                            <option value="name" <?= $sort === 'name' ? 'selected' : '' ?>>Name A-Z</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Filter</button>
                        <a href="sellers.php" class="btn btn-secondary">Reset</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- Sellers Grid Section -->
<section class="sellers-section">
    <div class="container">
        <div class="section-header text-center">
            <h2 class="section-title">Our Seller Community</h2>
            <p class="section-subtitle"><?= count($sellers) ?> verified sellers ready to serve you</p>
        </div>
        
        <?php if (empty($sellers)): ?>
            <div class="empty-state">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fas fa-store icon-large text-muted mb-3"></i>
                        <h3>No sellers found</h3>
                        <p class="text-muted">Try adjusting your search criteria or browse all sellers.</p>
                        <a href="sellers.php" class="btn btn-primary">View All Sellers</a>
                    </div>
                </div>
            </div>
        <?php else: ?>
            <div class="sellers-grid">
                <?php foreach ($sellers as $seller): ?>
                    <div class="seller-card">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="seller-avatar mb-3">
                                    <i class="fas fa-user-circle"></i>
                                </div>
                                
                                <h3 class="seller-name"><?= htmlspecialchars($seller['username']) ?></h3>
                                
                                <div class="seller-location mb-3">
                                    <i class="fas fa-map-marker-alt text-primary me-1"></i>
                                    <span class="text-muted"><?= htmlspecialchars($seller['city']) ?>, <?= htmlspecialchars($seller['province']) ?></span>
                                </div>
                                
                                <div class="seller-stats mb-3">
                                    <div class="stat-item">
                                        <i class="fas fa-shopping-bag text-primary me-1"></i>
                                        <span><?= $seller['product_count'] ?> Products</span>
                                    </div>
                                    
                                    <div class="stat-item">
                                        <?php if ($seller['avg_rating']): ?>
                                            <div class="rating">
                                                <?php 
                                                $rating = round($seller['avg_rating'], 1);
                                                for ($i = 1; $i <= 5; $i++): ?>
                                                    <i class="fas fa-star <?= $i <= $rating ? 'text-warning' : 'text-muted' ?>"></i>
                                                <?php endfor; ?>
                                                <span class="rating-text"><?= $rating ?> (<?= $seller['review_count'] ?>)</span>
                                            </div>
                                        <?php else: ?>
                                            <span class="badge badge-success">New Seller</span>
                                        <?php endif; ?>
                                    </div>
                                </div>
                                
                                <div class="seller-joined mb-4">
                                    <i class="fas fa-calendar-alt text-primary me-1"></i>
                                    <span class="text-muted">Joined <?= date('M Y', strtotime($seller['registration_date'])) ?></span>
                                </div>
                                
                                <div class="seller-actions">
                                    <a href="seller_profile.php?id=<?= $seller['user_id'] ?>" class="btn btn-primary btn-sm">
                                        View Profile
                                    </a>
                                    <a href="products.php?seller=<?= $seller['user_id'] ?>" class="btn btn-outline-primary btn-sm">
                                        View Products
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</section>

<!-- CTA Section -->
<section class="cta-section">
    <div class="container">
        <div class="cta-content text-center">
            <h2 class="cta-title">Want to Join Our Seller Community?</h2>
            <p class="cta-subtitle">Share your beautiful traditional clothing creations with customers across South Africa</p>
            
            <div class="benefits-grid">
                <div class="benefit-item">
                    <div class="benefit-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h4>Reach More Customers</h4>
                    <p>Connect with buyers passionate about traditional attire</p>
                </div>
                <div class="benefit-item">
                    <div class="benefit-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h4>Grow Your Business</h4>
                    <p>Use our platform to expand your traditional clothing business</p>
                </div>
                <div class="benefit-item">
                    <div class="benefit-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h4>Preserve Culture</h4>
                    <p>Help keep South African traditional clothing alive</p>
                </div>
            </div>
            
            <?php if (!$isLoggedIn || $userType === 'buyer'): ?>
                <a href="/lushaka-urithi/register.php?user_type=seller" class="btn btn-primary btn-lg">
                    Become a Seller Today
                </a>
            <?php endif; ?>
        </div>
    </div>
</section>

<style>
/* Sellers Page Specific Styles */
.hero-section {
    background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
    color: white;
    padding: 6rem 0;
    margin-bottom: 3rem;
}

.hero-title {
    font-size: 3.5rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
}

.hero-subtitle {
    font-size: 1.25rem;
    opacity: 0.9;
    max-width: 600px;
    margin: 0 auto;
}

.filters-section {
    padding: 2rem 0;
    background-color: var(--light-bg);
}

.filter-form .form-row {
    display: flex;
    gap: 1rem;
    align-items: end;
    flex-wrap: wrap;
}

.filter-form .form-group {
    flex: 1;
    min-width: 200px;
}

.filter-form .form-group:last-child {
    flex: 0 0 auto;
    display: flex;
    gap: 0.5rem;
}

.sellers-section {
    padding: 4rem 0;
}

.section-header {
    margin-bottom: 3rem;
}

.section-title {
    font-size: 2.5rem;
    color: var(--text-dark);
    margin-bottom: 1rem;
}

.section-subtitle {
    font-size: 1.125rem;
    color: var(--text-muted);
}

.sellers-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
}

.seller-card .card {
    height: 100%;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    border: 1px solid var(--border-color);
}

.seller-card .card:hover {
    transform: translateY(-5px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
}

.seller-avatar i {
    font-size: 4rem;
    color: var(--primary-color);
}

.seller-name {
    font-size: 1.5rem;
    font-weight: 600;
    color: var(--text-dark);
    margin-bottom: 1rem;
}

.seller-location {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.seller-stats {
    display: flex;
    justify-content: space-around;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
}

.stat-item {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.9rem;
}

.rating {
    display: flex;
    align-items: center;
    gap: 0.25rem;
}

.rating i {
    font-size: 0.875rem;
}

.rating-text {
    margin-left: 0.5rem;
    font-size: 0.875rem;
    color: var(--text-muted);
}

.seller-joined {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.seller-actions {
    display: flex;
    gap: 0.5rem;
    justify-content: center;
}

.seller-actions .btn {
    flex: 1;
}

.empty-state {
    max-width: 500px;
    margin: 0 auto;
}

.icon-large {
    font-size: 4rem;
}

.cta-section {
   background: linear-gradient(135deg, #666666 0%, #404040 100%);
    color: white;
    padding: 6rem 0;
    margin-top: 4rem;
}

.cta-title {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
}

.cta-subtitle {
    font-size: 1.25rem;
    margin-bottom: 3rem;
    opacity: 0.9;
}

.benefits-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2.5rem;
    max-width: 900px;
    margin: 0 auto 3rem;
}

.benefit-item {
    text-align: center;
}

.benefit-icon {
    font-size: 3rem;
    margin-bottom: 1.5rem;
    opacity: 0.9;
}

.benefit-item h4 {
    font-size: 1.25rem;
    margin-bottom: 1rem;
    font-weight: 600;
}

.benefit-item p {
    opacity: 0.8;
    line-height: 1.6;
}

/* Responsive Design */
@media (max-width: 768px) {
    .hero-title {
        font-size: 2.5rem;
    }
    
    .filter-form .form-row {
        flex-direction: column;
    }
    
    .filter-form .form-group {
        min-width: 100%;
    }
    
    .filter-form .form-group:last-child {
        flex-direction: row;
        justify-content: center;
    }
    
    .sellers-grid {
        grid-template-columns: 1fr;
    }
    
    .seller-stats {
        flex-direction: column;
        text-align: center;
    }
    
    .seller-actions {
        flex-direction: column;
    }
    
    .benefits-grid {
        grid-template-columns: 1fr;
        gap: 2rem;
    }
    
    .cta-section {
        padding: 4rem 1rem;
    }
    
    .cta-title {
        font-size: 2rem;
    }
}

@media (max-width: 480px) {
    .hero-section {
        padding: 4rem 1rem;
    }
    
    .hero-title {
        font-size: 2rem;
    }
    
    .hero-subtitle {
        font-size: 1rem;
    }
    
    .section-title {
        font-size: 2rem;
    }
}
</style>

<?php require_once 'templates/footer.php'; ?>