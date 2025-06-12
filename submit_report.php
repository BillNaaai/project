<?php
require 'db.php';
header('Content-Type: application/json');

$item_id = $_POST['item_id'] ?? null;
$user_id = $_POST['user_id'] ?? null;
$user_email = $_POST['user_email'] ?? null;
$issue = $_POST['issue'] ?? null;

if (!$item_id || !$user_id || !$user_email || !$issue) {
    echo json_encode(["error" => "Missing fields"]);
    exit;
}

$sql = "SELECT u.id AS seller_id, u.email AS seller_email
        FROM items i
        JOIN users u ON i.user_id = u.id
        WHERE i.id = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $item_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode(["error" => "Item not found"]);
    exit;
}

$seller = $result->fetch_assoc();

$insert = $conn->prepare("INSERT INTO reports 
    (item_id, seller_id, seller_email, reporter_id, reporter_email, issue, report_time) 
    VALUES (?, ?, ?, ?, ?, ?, NOW())");

$insert->bind_param("iissss", 
    $item_id,
    $seller['seller_id'],
    $seller['seller_email'],
    $user_id,
    $user_email,
    $issue
);

if ($insert->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["error" => "Database insert failed"]);
}
?>