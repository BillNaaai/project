<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

require 'db.php'; // This gives us $conn (MySQLi), not $pdo

// Get and decode JSON input
$data = json_decode(file_get_contents("php://input"), true);

// Validate input
if (
    !$data ||
    !isset($data["first_name"], $data["last_name"], $data["email"], $data["phone"], $data["password"])
) {
    echo json_encode(["error" => "Invalid input"]);
    exit();
}

$first_name = htmlspecialchars($data["first_name"]);
$last_name = htmlspecialchars($data["last_name"]);
$email = filter_var($data["email"], FILTER_SANITIZE_EMAIL);
$phone = htmlspecialchars($data["phone"]);
$password = $data["password"];

// Hash the password before storing
$password_hash = password_hash($password, PASSWORD_DEFAULT);

try {
    // Check if user already exists
    $stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        echo json_encode(["error" => "User already exists"]);
        exit();
    }
    $stmt->close();

    // Insert user
    $stmt = $conn->prepare("INSERT INTO users (first_name, last_name, email, phone, password_hash, created_at)
                            VALUES (?, ?, ?, ?, ?, NOW())");
    $stmt->bind_param("sssss", $first_name, $last_name, $email, $phone, $password_hash);
    $stmt->execute();

    // Return user data to auto-login
    echo json_encode([
        "message" => "Registration successful",
        "user" => [
            "id" => $stmt->insert_id,
            "first_name" => $first_name,
            "last_name" => $last_name,
            "email" => $email,
            "phone" => $phone,
            "address" => null,
            "business_name" => null
        ]
    ]);

    $stmt->close();
    $conn->close();

} catch (Exception $e) {
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    exit();
}
?>