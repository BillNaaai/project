<?php
header('Content-Type: application/json');
require 'db.php';

$seller_id = isset($_GET['seller_id']) ? (int) $_GET['seller_id'] : 0;
if ($seller_id <= 0) {
    echo json_encode(['error' => 'Invalid seller ID']);
    exit;
}

$sql = "SELECT COUNT(*) AS order_count, COALESCE(SUM(price * quantity), 0) AS total_sales
        FROM order_items
        WHERE seller_id = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $seller_id);
$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_assoc();

echo json_encode($data);

$stmt->close();
$conn->close();
?>
