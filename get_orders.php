<?php 
header('Content-Type: application/json');
require_once 'db.php';

if (!isset($_GET['buyer_id']) || !is_numeric($_GET['buyer_id'])) {
    echo json_encode([]);
    exit;
}

$buyer_id = intval($_GET['buyer_id']);

$orderQuery = $conn->prepare("
    SELECT order_id, total_amount, created_at 
    FROM orders 
    WHERE buyer_id = ? 
    ORDER BY created_at DESC
");
$orderQuery->bind_param("i", $buyer_id);
$orderQuery->execute();
$orderResult = $orderQuery->get_result();

$orders = [];

while ($order = $orderResult->fetch_assoc()) {
    $order_id = $order['order_id'];

    $itemQuery = $conn->prepare("
        SELECT 
            oi.quantity, 
            oi.price, 
            i.title, 
            u.email AS seller_email
        FROM order_items oi
        JOIN items i ON oi.item_id = i.id
        JOIN users u ON oi.seller_id = u.id
        WHERE oi.order_id = ?
    ");
    $itemQuery->bind_param("i", $order_id);
    $itemQuery->execute();
    $itemResult = $itemQuery->get_result();

    $items = [];
    while ($item = $itemResult->fetch_assoc()) {
        $items[] = [
            'title' => $item['title'],
            'quantity' => $item['quantity'],
            'price' => $item['price'],
            'seller_email' => $item['seller_email']  
        ];
    }

    $orders[] = [
        'order_id' => $order_id,
        'order_date' => date('Y-m-d', strtotime($order['created_at'])),
        'total_amount' => $order['total_amount'],
        'items' => $items
    ];
}

echo json_encode($orders);
