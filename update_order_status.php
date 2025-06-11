<?php
header('Content-Type: application/json');
require 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['order_id'], $data['item_id'], $data['status'])) {
    echo json_encode(["success" => false, "message" => "Missing fields"]);
    exit;
}

$order_id = (int) $data['order_id'];
$item_id = (int) $data['item_id'];
$status = trim($data['status']);

$allowed = ['Pending', 'Shipped', 'Completed', 'Cancelled'];
if (!in_array($status, $allowed)) {
    echo json_encode(["success" => false, "message" => "Invalid status"]);
    exit;
}

$stmt = $conn->prepare("UPDATE order_items SET status = ? WHERE order_id = ? AND item_id = ?");
$stmt->bind_param("sii", $status, $order_id, $item_id);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "message" => "Update failed"]);
}

$stmt->close();
$conn->close();
?>
