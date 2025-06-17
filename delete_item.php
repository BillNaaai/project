<?php
header("Content-Type: application/json");
require 'db.php';

// Read raw input and decode
$data = json_decode(file_get_contents("php://input"), true);

// Check both possible keys
$id = $data['id'] ?? $data['item_id'] ?? null;

if (!$id) {
    echo json_encode(["error" => "Missing item ID"]);
    exit;
}

$item_id = intval($id);

try {
    $stmt = $conn->prepare("DELETE FROM items WHERE id = ?");
    $stmt->bind_param("i", $item_id);
    $stmt->execute();

    echo json_encode(["success" => true]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Error deleting item: " . $e->getMessage()]);
}
