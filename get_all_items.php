<?php
// Show PHP errors in browser
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Return JSON
header('Content-Type: application/json');

// DB connection
require_once 'db.php'; // This should set $conn as a MySQLi connection

try {
    $query = "SELECT id, title, description, price, category, image_url, user_id FROM items ORDER BY id DESC";
    $result = $conn->query($query);

    if (!$result) {
        throw new Exception("Query failed: " . $conn->error);
    }

    $items = [];
    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }

    echo json_encode($items);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Server error: " . $e->getMessage()]);
}
?>
