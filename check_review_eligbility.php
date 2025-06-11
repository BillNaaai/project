<?php
header('Content-Type: application/json');
require 'db.php'; // your database connection

// Validate input
$user_id = isset($_GET['user_id']) ? intval($_GET['user_id']) : 0;
$item_id = isset($_GET['item_id']) ? intval($_GET['item_id']) : 0;

if ($user_id <= 0 || $item_id <= 0) {
    echo json_encode(["eligible" => false, "error" => "Invalid user or item ID."]);
    exit;
}

try {
    // Check if the user has bought this item
    $sql = "
        SELECT oi.id
        FROM orders o
        JOIN order_items oi ON o.id = oi.order_id
        WHERE o.buyer_id = :user_id
        AND oi.item_id = :item_id
        LIMIT 1
    ";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':user_id' => $user_id,
        ':item_id' => $item_id
    ]);

    $eligible = $stmt->fetch() ? true : false;

    echo json_encode(["eligible" => $eligible]);

} catch (Exception $e) {
    echo json_encode(["eligible" => false, "error" => $e->getMessage()]);
}
?>
