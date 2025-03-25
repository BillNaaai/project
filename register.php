<?php
// ✅ Start debugging log
file_put_contents("debug_register.log", "Script started\n", FILE_APPEND);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

require 'db.php';

// ✅ Log database connection check
if (!isset($pdo)) {
    file_put_contents("debug_register.log", "Database connection failed!\n", FILE_APPEND);
    die(json_encode(["error" => "Database connection failed"]));
} else {
    file_put_contents("debug_register.log", "Database connection successful\n", FILE_APPEND);
}

// ✅ Read JSON input and log it
$data = json_decode(file_get_contents("php://input"), true);
file_put_contents("debug_register.log", "Received Data: " . json_encode($data) . "\n", FILE_APPEND);

if (!$data) {
    file_put_contents("debug_register.log", "Error: No JSON data received\n", FILE_APPEND);
    die(json_encode(["error" => "No JSON data received"]));
}

if (isset($data["first_name"], $data["last_name"], $data["email"], $data["password"])) {
    $first_name = htmlspecialchars($data["first_name"]);
    $last_name = htmlspecialchars($data["last_name"]);
    $email = filter_var($data["email"], FILTER_SANITIZE_EMAIL);
    $phone = htmlspecialchars($data["phone"] ?? "");
    $password_hash = $data["password"]; // 🚨 Plain text password (Insecure)

    try {
        $stmt = $pdo->prepare("INSERT INTO users (first_name, last_name, email, phone, password_hash) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$first_name, $last_name, $email, $phone, $password_hash]);

        // ✅ Log successful insert
        file_put_contents("debug_register.log", "Inserted User: $email\n", FILE_APPEND);
        echo json_encode(["message" => "Registration successful"]);
    } catch (PDOException $e) {
        file_put_contents("debug_register.log", "Database error: " . $e->getMessage() . "\n", FILE_APPEND);
        die(json_encode(["error" => "Database error: " . $e->getMessage()]));
    }
} else {
    file_put_contents("debug_register.log", "Error: Invalid input\n", FILE_APPEND);
    die(json_encode(["error" => "Invalid input"]));
}
?>