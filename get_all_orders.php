<?php
header('Content-Type: application/json');
require 'db.php';

$query = "
SELECT o.order_id, o.buyer_id, o.total_amount, o.created_at, u.first_name, u.last_name
FROM orders o
JOIN users u ON o.buyer_id = u.id
ORDER BY o.created_at DESC";
$result = $conn->query($query);

$orders = [];
while ($row = $result->fetch_assoc()) {
    $orders[] = $row;
}

echo json_encode($orders);
$conn->close();
?>
