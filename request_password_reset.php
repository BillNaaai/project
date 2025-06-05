<?php
header('Content-Type: application/json');
require_once 'db.php';

// Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Get and validate input
$data = json_decode(file_get_contents("php://input"), true);
$email = trim($data['email'] ?? '');

if (empty($email)) {
    http_response_code(400);
    echo json_encode(["error" => "Email is required."]);
    exit;
}

try {
    // Prepare and bind
    $stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if (!$user) {
        echo json_encode(["error" => "No account found with that email."]);
        exit;
    }

    // Generate token
    $token = bin2hex(random_bytes(32));
    $expires = date('Y-m-d H:i:s', strtotime('+1 hour'));

    // Insert into password_resets
    $insert = $conn->prepare("INSERT INTO password_resets (email, token, expires_at) VALUES (?, ?, ?)");
    $insert->bind_param("sss", $email, $token, $expires);
    $insert->execute();

    // Build reset link (update to your actual site URL)
    $resetLink = "http://localhost/project/resetpassword.html?token=$token";

    echo json_encode([
        "success" => true,
        "message" => "Reset link generated.",
        "reset_link" => $resetLink
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Server error: " . $e->getMessage()]);
}
?>
