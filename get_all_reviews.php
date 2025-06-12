<?php
header('Content-Type: application/json');
require 'db.php';

$query = "
SELECT r.id, r.rating, r.comment, r.created_at, u.first_name, u.last_name, i.title AS item_title 
FROM reviews r 
JOIN users u ON r.user_id = u.id 
JOIN items i ON r.item_id = i.id 
ORDER BY r.created_at DESC";
$result = $conn->query($query);

$reviews = [];
while ($row = $result->fetch_assoc()) {
    $reviews[] = $row;
}

echo json_encode($reviews);
$conn->close();
?>