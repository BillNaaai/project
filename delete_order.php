<?php
header('Content-Type: application/json');
require 'db.php';

$data = json_decode(file_get_contents("php://input"), true);
if (!isset($data['order_id'])) {
    echo json_encode(["success" => false, "error" => "Missing order ID"]);
    exit;
}

$order_id = (int)$data['order_id'];

// Optional: delete related items from order_items table if applicable
$conn->begin_transaction();
try {
    $stmtItems = $conn->prepare("DELETE FROM order_items WHERE order_id = ?");
    $stmtItems->bind_param("i", $order_id);
    $stmtItems->execute();
    $stmtItems->close();

    $stmt = $conn->prepare("DELETE FROM orders WHERE order_id = ?");
    $stmt->bind_param("i", $order_id);
    $stmt->execute();
    $stmt->close();

    $conn->commit();
    echo json_encode(["success" => true]);
} catch (Exception $e) {
    $conn->rollback();
    echo json_encode(["success" => false, "error" => "Failed to delete order."]);
}

$conn->close();
?>
