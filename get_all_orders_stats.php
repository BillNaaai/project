<?php
header('Content-Type: application/json');
require 'db.php';

$result = $conn->query("SELECT * FROM orders");
$orders = [];
$totalSales = 0;
$totalOrders = 0;

while ($row = $result->fetch_assoc()) {
    $orders[] = $row;
    $totalSales += $row['total_amount'];
    $totalOrders++;
}

echo json_encode([
    "orders" => $orders,
    "total_sales" => $totalSales,
    "total_orders" => $totalOrders
]);

$conn->close();
?>