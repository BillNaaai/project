<?php
header('Content-Type: application/json');
require_once 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['email']) || !isset($data['password'])) {
    echo json_encode(["error" => "Missing email or password"]);
    exit;
}

$email = $data['email'];
$password = $data['password'];

$stmt = $conn->prepare("SELECT * FROM admins WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$adminResult = $stmt->get_result();

if ($adminResult->num_rows === 1) {
    $admin = $adminResult->fetch_assoc();
    if (password_verify($password, $admin['password_hash'])) {
        echo json_encode([
            "message" => "Login successful",
            "is_admin" => true,
            "admin" => [
                "id" => $admin['id'],
                "email" => $admin['email']
            ]
        ]);
        exit;
    }
}

$stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$userResult = $stmt->get_result();

if ($userResult->num_rows === 1) {
    $user = $userResult->fetch_assoc();
    if (password_verify($password, $user['password_hash'])) {
        echo json_encode([
            "message" => "Login successful",
            "user" => [
                "id" => $user['id'],
                "first_name" => $user['first_name'],
                "last_name" => $user['last_name'],
                "email" => $user['email'],
                "phone" => $user['phone'],
                "address" => $user['address'],
                "business_name" => $user['business_name']
            ]
        ]);
        exit;
    }
}

echo json_encode(["error" => "Invalid email or password"]);
?>