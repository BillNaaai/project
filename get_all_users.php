<?php
header('Content-Type: application/json');
require 'db.php';

$result = $conn->query("SELECT id, first_name, last_name, email, phone, created_at FROM users ORDER BY created_at DESC");

$users = [];
while ($row = $result->fetch_assoc()) {
    $users[] = $row;
}

echo json_encode($users);
$conn->close();
?>