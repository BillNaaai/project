<?php
header("Content-Type: application/json");
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["error" => "Method Not Allowed"]);
    exit;
}

$input = json_decode(file_get_contents("php://input"), true);
if (
    !$input ||
    !isset($input['user_id']) || 
    !is_numeric($input['user_id'])
) {
    http_response_code(400);
    echo json_encode(["error" => "Missing or invalid user ID"]);
    exit;
}

$userId = intval($input['user_id']);

$fields = [];
$types = "";
$params = [];

if (!empty($input['address'])) {
    $fields[] = "address = ?";
    $types .= "s";
    $params[] = $input['address'];
}
if (!empty($input['phone'])) {
    $fields[] = "phone = ?";
    $types .= "s";
    $params[] = $input['phone'];
}
if (!empty($input['business_name'])) {
    $fields[] = "business_name = ?";
    $types .= "s";
    $params[] = $input['business_name'];
}

if (empty($fields)) {
    echo json_encode(["error" => "No fields to update"]);
    exit;
}

$types .= "i";
$params[] = $userId;

$sql = "UPDATE users SET " . implode(", ", $fields) . " WHERE id = ?";

try {
    $stmt = $conn->prepare($sql);
    $stmt->bind_param($types, ...$params);
    $stmt->execute();

    $stmt = $conn->prepare("SELECT * FROM users WHERE id = ?");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    echo json_encode([
        "message" => "Profile updated successfully",
        "user" => $user
    ]);

    $stmt->close();
    $conn->close();

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    exit;
}
?>