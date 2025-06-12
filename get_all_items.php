<?php
header('Content-Type: application/json');

require_once 'db.php'; 

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