<?php
header("Content-Type: application/json");
require_once 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

// ✅ Require item_id
if (!isset($data['item_id'])) {
    echo json_encode(["error" => "Missing item_id"]);
    exit;
}

$item_id = $data['item_id'];

try {
    // ✅ Fetch current item
    $stmt = $conn->prepare("SELECT * FROM items WHERE id = ?");
    $stmt->execute([$item_id]);
    $existingItem = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$existingItem) {
        echo json_encode(["error" => "Item not found"]);
        exit;
    }

    // ✅ Use sent values or fall back to existing ones
    $title = isset($data['title']) ? htmlspecialchars($data['title']) : $existingItem['title'];
    $description = isset($data['description']) ? htmlspecialchars($data['description']) : $existingItem['description'];
    $price = isset($data['price']) ? floatval(str_replace(',', '.', $data['price'])) : $existingItem['price'];
    $category = isset($data['category']) ? htmlspecialchars($data['category']) : $existingItem['category'];
    $image_url = isset($data['image_url']) ? htmlspecialchars($data['image_url']) : $existingItem['image_url'];

    // ✅ Update item
    $update = $conn->prepare("UPDATE items SET title = ?, description = ?, price = ?, category = ?, image_url = ? WHERE id = ?");
    $update->execute([$title, $description, $price, $category, $image_url, $item_id]);

    echo json_encode(["success" => true, "message" => "Item updated successfully"]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
