<?php
header('Content-Type: application/json');
require_once 'db.php'; // This provides $conn (MySQLi)

// Read JSON input
$data = json_decode(file_get_contents('php://input'), true);

// Validate input
if (!$data || !isset($data['email']) || !isset($data['password'])) {
    echo json_encode(["error" => "Missing email or password"]);
    exit;
}

$email = $data['email'];
$password = $data['password'];

try {
    // Prepare and execute select query
    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if user exists
    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        // Verify password
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
        } else {
            echo json_encode(["error" => "Invalid email or password"]);
        }
    } else {
        echo json_encode(["error" => "Invalid email or password"]);
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => "Server error: " . $e->getMessage()]);
}
?>