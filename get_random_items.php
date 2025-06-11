<?php
// get_random_items.php

header('Content-Type: application/json');

// Database credentials
$host = 'localhost';
$db   = 'e-shop';     // ⬅️ Replace with your DB name
$user = 'root';         // ⬅️ Replace with your DB username
$pass = '';         // ⬅️ Replace with your DB password
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);

    // Get 6 random items
    $stmt = $pdo->query("SELECT id, title, price, image_url FROM items ORDER BY RAND() LIMIT 20");
    $items = $stmt->fetchAll();

    echo json_encode($items);

} catch (PDOException $e) {
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}
