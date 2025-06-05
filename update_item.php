<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
header("Content-Type: application/json");
require_once 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

// ✅ Require item_id
if (!isset($data['item_id'])) {
    echo json_encode(["error" => "Missing item_id"]);
    exit;
}

$item_id = intval($data['item_id']);

// Optional fallback values (assume values are sent directly from the front-end)
$title = isset($data['title']) ? htmlspecialchars($data['title']) : '';
$description = isset($data['description']) ? htmlspecialchars($data['description']) : '';
$price = isset($data['price']) ? floatval(str_replace(',', '.', $data['price'])) : 0.00;
$category = isset($data['category']) ? htmlspecialchars($data['category']) : '';
$image_url = isset($data['image_url']) ? htmlspecialchars($data['image_url']) : '';

try {
    // ✅ Prepare and bind
    $stmt = $conn->prepare("UPDATE items SET title = ?, description = ?, price = ?, category = ?, image_url = ? WHERE id = ?");
    $stmt->bind_param("ssdssi", $title, $description, $price, $category, $image_url, $item_id);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Item updated successfully"]);
    } else {
        echo json_encode(["success" => false, "error" => "Failed to update item"]);
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Server error: " . $e->getMessage()]);
}
?>
