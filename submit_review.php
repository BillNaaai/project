<?php
require 'db.php';
header('Content-Type: application/json');

$data = json_decode(file_get_contents("php://input"), true);

$user_id = intval($data['user_id']);
$item_id = intval($data['item_id']);
$rating = intval($data['rating']);
$comment = trim($data['comment'] ?? '');

// Check: did user order this item?
$orderCheck = $conn->prepare("
  SELECT oi.id 
  FROM orders o 
  JOIN order_items oi ON o.id = oi.order_id 
  WHERE o.user_id = ? AND oi.item_id = ?
");
$orderCheck->bind_param("ii", $user_id, $item_id);
$orderCheck->execute();
$orderCheck->store_result();

if ($orderCheck->num_rows === 0) {
    echo json_encode(["success" => false, "error" => "You must purchase this item before reviewing."]);
    exit;
}

// Check: is user the seller?
$sellerCheck = $conn->prepare("SELECT user_id FROM items WHERE id = ?");
$sellerCheck->bind_param("i", $item_id);
$sellerCheck->execute();
$sellerCheck->bind_result($seller_id);
$sellerCheck->fetch();

if ($seller_id == $user_id) {
    echo json_encode(["success" => false, "error" => "Sellers cannot review their own items."]);
    exit;
}

// Save review
$stmt = $conn->prepare("INSERT INTO reviews (user_id, item_id, rating, comment) VALUES (?, ?, ?, ?)");
$stmt->bind_param("iiis", $user_id, $item_id, $rating, $comment);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "error" => "Failed to submit review."]);
}
?>
