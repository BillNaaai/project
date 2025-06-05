<?php
header('Content-Type: application/json');
require_once 'db.php';

try {
    $query = "SELECT id, title, description, price, category, image_url FROM items ORDER BY id DESC";
    $result = $conn->query($query);

    $items = [];

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $items[] = $row;
        }
        echo json_encode($items);
    } else {
        http_response_code(500);
        echo json_encode(["error" => "Failed to fetch items"]);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Server error: " . $e->getMessage()]);
}
?>
