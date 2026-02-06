<?php
$host = 'sql105.infinityfree.com'; // Replace with actual host from your dashboard
$db   = 'if0_39333820_Lushaka_urithi';
$username = 'if0_39333820';
$password = 'Shandukani1';


$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
