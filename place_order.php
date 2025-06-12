<?php
header('Content-Type: application/json');

require_once 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo json_encode(["error" => "Invalid or empty JSON"]);
    exit;
}

if (!isset($data['buyer_id']) || !is_array($data['items']) || count($data['items']) === 0) {
    echo json_encode(["error" => "Invalid input"]);
    exit;
}

$buyer_id = $data['buyer_id'];
$items = $data['items'];
$total = floatval($data['total_amount']);

$stmt = $conn->prepare("INSERT INTO orders (buyer_id, total_amount) VALUES (?, ?)");
$stmt->bind_param("id", $buyer_id, $total);
if (!$stmt->execute()) {
    echo json_encode(["error" => "Failed to create order: " . $stmt->error]);
    exit;
}
$order_id = $stmt->insert_id;

$item_stmt = $conn->prepare("INSERT INTO order_items (order_id, item_id, seller_id, quantity, price) VALUES (?, ?, ?, ?, ?)");

foreach ($items as $item) {
    $item_id = intval($item['id']);
    $seller_id = intval($item['seller_id'] ?? 0);
    $quantity = intval($item['quantity'] ?? 1);
    $price = floatval($item['price']);

    $item_stmt->bind_param("iiiid", $order_id, $item_id, $seller_id, $quantity, $price);
    if (!$item_stmt->execute()) {
        echo json_encode(["error" => "Failed to insert order item: " . $item_stmt->error]);
        exit;
    }
}

echo json_encode(["success" => true]);
?>