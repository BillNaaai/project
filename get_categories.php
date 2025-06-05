<?php
header('Content-Type: application/json');
require_once 'db.php';

try {
    $query = "SELECT DISTINCT category FROM items ORDER BY category ASC";
    $result = $conn->query($query);

    $categories = [];

    while ($row = $result->fetch_assoc()) {
        $categories[] = $row['category'];
    }

    echo json_encode($categories);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Failed to fetch categories: " . $e->getMessage()]);
}
?>
