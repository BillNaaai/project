<?php
header('Content-Type: application/json');
require 'db.php';

session_start();
$seller_id = isset($_SESSION['user']['id']) ? $_SESSION['user']['id'] : (isset($_GET['seller_id']) ? intval($_GET['seller_id']) : 0);

if ($seller_id <= 0) {
    echo json_encode(["error" => "Invalid seller ID."]);
    exit;
}

$sql = "
    SELECT 
  o.order_id,
  oi.item_id, 
  oi.quantity,
  oi.price,
  oi.status,
  o.created_at,
  i.title AS item_title,
  i.image_url,
  u.first_name,
  u.last_name,
  u.email
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN items i ON oi.item_id = i.id
JOIN users u ON o.buyer_id = u.id
WHERE oi.seller_id = ?
ORDER BY o.created_at DESC
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $seller_id);
$stmt->execute();
$result = $stmt->get_result();

$orders = [];
while ($row = $result->fetch_assoc()) {
    $orders[] = $row;
}

echo json_encode($orders);