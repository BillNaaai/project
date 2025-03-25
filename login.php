<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

require 'db.php';

// ✅ Debug received request
file_put_contents("debug_login.log", "Login request received\n", FILE_APPEND);

// ✅ Read JSON input
$data = json_decode(file_get_contents("php://input"), true);
file_put_contents("debug_login.log", "Received Data: " . json_encode($data) . "\n", FILE_APPEND);

if (!$data) {
    file_put_contents("debug_login.log", "Error: No JSON data received\n", FILE_APPEND);
    echo json_encode(["error" => "No JSON data received"]);
    exit();
}

if (isset($data["email"], $data["password"])) {
    $email = filter_var($data["email"], FILTER_SANITIZE_EMAIL);
    $password = $data["password"];

    file_put_contents("debug_login.log", "Searching for user: $email\n", FILE_APPEND);

    try {
        // ✅ Fetch user from database
        $stmt = $pdo->prepare("SELECT id, first_name, email, password_hash FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            file_put_contents("debug_login.log", "User found: " . json_encode($user) . "\n", FILE_APPEND);

            // ✅ Compare passwords (plaintext, since you removed hashing)
            if ($password === $user["password_hash"]) {
                session_start();
                $_SESSION["user_id"] = $user["id"];
                $_SESSION["first_name"] = $user["first_name"];

                file_put_contents("debug_login.log", "Login successful for: $email\n", FILE_APPEND);

                echo json_encode([
                    "message" => "Login successful",
                    "user" => [
                        "id" => $user["id"],
                        "first_name" => $user["first_name"],
                        "email" => $user["email"]
                    ]
                ]);
                exit();
            } else {
                file_put_contents("debug_login.log", "Password mismatch for: $email\n", FILE_APPEND);
                echo json_encode(["error" => "Invalid email or password"]);
                exit();
            }
        } else {
            file_put_contents("debug_login.log", "User not found: $email\n", FILE_APPEND);
            echo json_encode(["error" => "Invalid email or password"]);
            exit();
        }
    } catch (PDOException $e) {
        file_put_contents("debug_login.log", "Database error: " . $e->getMessage() . "\n", FILE_APPEND);
        echo json_encode(["error" => "Database error: " . $e->getMessage()]);
        exit();
    }
} else {
    file_put_contents("debug_login.log", "Error: Invalid input\n", FILE_APPEND);
    echo json_encode(["error" => "Invalid input"]);
}
?>