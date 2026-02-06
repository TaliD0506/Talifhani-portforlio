<?php
session_start();

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'buyer') {
    header("Location: ../login.php");
    exit();
}

$id = $_GET['id'] ?? null;

if ($id && isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array_filter($_SESSION['cart'], function ($pid) use ($id) {
        return $pid != $id;
    });
}

header("Location: cart.php");
exit();
