<?php
require_once 'templates/header.php';

$stmt = $pdo->query("SELECT * FROM categories");
$categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<section class="categories">
    <h2>Browse All Cultures</h2>
    <div class="category-grid">
        <?php foreach ($categories as $category): ?>
            <div class="category-card">
                <a href="category.php?id=<?= $category['category_id'] ?>">
                    <img src="assets/images/categories/<?= $category['image'] ?>" alt="<?= $category['name'] ?>">
                    <h3><?= $category['name'] ?></h3>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
</section>
<?php require_once 'templates/footer.php'; ?>
