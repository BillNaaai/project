<?php
header('Content-Type: application/json');
require 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

if (
    !$data ||
    !isset($data["title"], $data["description"], $data["price"], $data["category"], $data["user_id"])
) {
    echo json_encode(["error" => "Missing required fields."]);
    exit;
}

$title = htmlspecialchars($data["title"]);
$description = htmlspecialchars($data["description"]);
$price = floatval($data["price"]);
$category = htmlspecialchars($data["category"]);
$image_url = !empty($data["image_url"]) ? htmlspecialchars($data["image_url"]) : null;
$user_id = intval($data["user_id"]);

try {
    $stmt = $conn->prepare("
        INSERT INTO items (user_id, title, description, price, category, image_url, created_at)
        VALUES (?, ?, ?, ?, ?, ?, NOW())
    ");
    $stmt->bind_param("issdss", $user_id, $title, $description, $price, $category, $image_url);
    $stmt->execute();

    echo json_encode([
        "success" => true,
        "message" => "Item listed successfully"
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}