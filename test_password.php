<?php
require 'db.php';

$email = "john@example.com";  // Replace with your test email
$password = "password123!";   // Use the exact password you entered

$stmt = $pdo->prepare("SELECT password_hash FROM users WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user) {
    if (password_verify($password, $user["password_hash"])) {
        echo "✅ Password is CORRECT!";
    } else {
        echo "❌ Password is INCORRECT!";
    }
} else {
    echo "❌ Email not found!";
}
?>