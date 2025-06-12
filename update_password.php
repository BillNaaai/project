<?php
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'error' => 'Invalid request method.']);
    exit;
}

$data = json_decode(file_get_contents("php://input"), true);

if (!is_array($data)) {
    echo json_encode(['success' => false, 'error' => 'Invalid JSON input.']);
    exit;
}

if (!isset($data['email']) || !isset($data['newPassword'])) {
    echo json_encode(['success' => false, 'error' => 'Missing email or newPassword.']);
    exit;
}

$email = trim($data['email']);
$newPassword = $data['newPassword'];

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['success' => false, 'error' => 'Invalid email format.']);
    exit;
}

require 'db.php';

$stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
if (!$stmt) {
    echo json_encode(['success' => false, 'error' => 'Prepare failed: ' . $conn->error]);
    exit;
}

$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode(['success' => false, 'error' => 'Email not found.']);
    $stmt->close();
    $conn->close();
    exit;
}
$stmt->close();

$hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

$updateStmt = $conn->prepare("UPDATE users SET password_hash = ? WHERE email = ?");
if (!$updateStmt) {
    echo json_encode(['success' => false, 'error' => 'Update prepare failed: ' . $conn->error]);
    exit;
}

$updateStmt->bind_param("ss", $hashedPassword, $email);
if ($updateStmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'error' => 'Password update failed.']);
}

$updateStmt->close();
$conn->close();
?>