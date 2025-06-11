<?php
require 'db.php';
header('Content-Type: application/json');

$seller_id = $_POST['seller_id'] ?? null;

if (!$seller_id) {
    echo json_encode(["error" => "Seller ID missing"]);
    exit;
}

$sql = "
    SELECT 
        oi.order_item_id,
        oi.order_id,
        oi.item_id,
        oi.quantity,
        oi.price,
        oi.status,
        i.title,
        i.image_url,
        u.first_name,
        u.last_name
    FROM order_items oi
    JOIN items i ON oi.item_id = i.id
    JOIN orders o ON oi.order_id = o.id
    JOIN users u ON o.buyer_id = u.id
    WHERE oi.seller_id = ?
    ORDER BY o.created_at DESC
";

$stmt = $con->prepare($sql);
$stmt->bind_param("i", $seller_id);
$stmt->execute();

$result = $stmt->get_result();
$orders = [];

while ($row = $result->fetch_assoc()) {
    $orders[] = $row;
}

echo json_encode($orders);
$stmt->close();
?>
