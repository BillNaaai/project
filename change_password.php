<?php
header("Content-Type: application/json");
require_once 'db.php';

session_start();

$data = json_decode(file_get_contents("php://input"), true);

// Validate input
if (!isset($_SESSION['user']['id'])) {
    http_response_code(401);
    echo json_encode(["error" => "Not logged in"]);
    exit;
}

if (!isset($data['password']) || strlen($data['password']) < 8) {
    http_response_code(400);
    echo json_encode(["error" => "Password must be at least 8 characters"]);
    exit;
}

$userId = $_SESSION['user']['id'];
$passwordHash = password_hash($data['password'], PASSWORD_DEFAULT);

try {
    $stmt = $conn->prepare("UPDATE users SET password_hash = ? WHERE id = ?");
    $stmt->execute([$passwordHash, $userId]);

    echo json_encode(["success" => true, "message" => "Password updated successfully"]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
