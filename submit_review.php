<?php
header('Content-Type: application/json');
require 'db.php'; 

$data = json_decode(file_get_contents("php://input"), true);

if (!$data || !isset($data['item_id'], $data['user_id'], $data['rating'], $data['comment'])) {
    echo json_encode(["success" => false, "message" => "Missing required fields."]);
    exit;
}

$item_id = (int) $data['item_id'];
$user_id = (int) $data['user_id'];
$rating = (int) $data['rating'];
$comment = trim($data['comment']);

if ($rating < 1 || $rating > 5) {
    echo json_encode(["success" => false, "message" => "Rating must be between 1 and 5."]);
    exit;
}

$check = $conn->prepare("SELECT id FROM reviews WHERE user_id = ? AND item_id = ?");
$check->bind_param("ii", $user_id, $item_id);
$check->execute();
$check->store_result();

if ($check->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "You have already reviewed this item."]);
    $check->close();
    exit;
}
$check->close();

$stmt = $conn->prepare("INSERT INTO reviews (item_id, user_id, rating, comment, created_at) VALUES (?, ?, ?, ?, NOW())");

if (!$stmt) {
    echo json_encode(["success" => false, "message" => "Prepare failed: " . $conn->error]);
    exit;
}

$stmt->bind_param("iiis", $item_id, $user_id, $rating, $comment);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "message" => "Execute failed: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>