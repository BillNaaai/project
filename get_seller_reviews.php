<?php
header('Content-Type: application/json');
require 'db.php';

if (!isset($_GET['seller_id'])) {
    echo json_encode(["error" => "Missing seller ID"]);
    exit;
}

$seller_id = intval($_GET['seller_id']);

// Fetch all reviews for items owned by this seller
$query = "
    SELECT r.rating, r.comment, r.created_at,
           u.first_name, u.last_name,
           i.title AS item_title
    FROM reviews r
    JOIN users u ON r.user_id = u.id
    JOIN items i ON r.item_id = i.id
    WHERE i.user_id = ?
";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $seller_id);
$stmt->execute();
$result = $stmt->get_result();

$reviews = [];
$total_rating = 0;
$count = 0;

while ($row = $result->fetch_assoc()) {
    $reviews[] = $row;
    $total_rating += $row['rating'];
    $count++;
}

$stmt->close();
$conn->close();

$average = $count > 0 ? round($total_rating / $count, 1) : 0;

echo json_encode([
    "reviews" => $reviews,
    "average_rating" => $average
]);
?>
