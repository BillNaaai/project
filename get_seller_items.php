<?php
require 'db.php';
header('Content-Type: application/json');

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['seller_id'])) {
    echo json_encode(["error" => "Missing seller_id"]);
    exit;
}

$seller_id = intval($data['seller_id']);

try {
    $stmt = $conn->prepare("SELECT * FROM items WHERE user_id = ?");
    $stmt->bind_param("i", $seller_id);
    $stmt->execute();

    $result = $stmt->get_result();
    $items = [];

    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }

    echo json_encode($items);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}