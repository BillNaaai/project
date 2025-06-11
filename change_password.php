<?php
header('Content-Type: application/json');
require_once 'db.php'; // assumes you already have a db connection script

$data = json_decode(file_get_contents("php://input"), true);

// Validate input
if (!isset($data['user_id'])) {
    echo json_encode(["success" => false, "error" => "User ID is required."]);
    exit;
}

$user_id = intval($data['user_id']);
$first_name = isset($data['first_name']) ? trim($data['first_name']) : null;
$last_name = isset($data['last_name']) ? trim($data['last_name']) : null;
$email = isset($data['email']) ? trim($data['email']) : null;
$password = isset($data['password']) ? $data['password'] : null;

// Prepare SQL dynamically
$fields = [];
$params = [];
$types = '';

if ($first_name !== null && $first_name !== '') {
    $fields[] = "first_name = ?";
    $params[] = $first_name;
    $types .= 's';
}

if ($last_name !== null && $last_name !== '') {
    $fields[] = "last_name = ?";
    $params[] = $last_name;
    $types .= 's';
}

if ($email !== null && $email !== '') {
    $fields[] = "email = ?";
    $params[] = $email;
    $types .= 's';
}

if ($password !== null && $password !== '') {
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    $fields[] = "password_hash = ?";
    $params[] = $hashed_password;
    $types .= 's';
}

if (empty($fields)) {
    echo json_encode(["success" => false, "error" => "No valid fields to update."]);
    exit;
}

// Add user ID for WHERE clause
$params[] = $user_id;
$types .= 'i';

$sql = "UPDATE users SET " . implode(", ", $fields) . " WHERE id = ?";

$stmt = $conn->prepare($sql);
if (!$stmt) {
    echo json_encode(["success" => false, "error" => "SQL prepare failed: " . $conn->error]);
    exit;
}

$stmt->bind_param($types, ...$params);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "error" => "Update failed: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
