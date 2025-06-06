<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
header('Content-Type: application/json');
require_once 'db.php';

// Validate item ID from query string
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo json_encode(['error' => 'Invalid item ID']);
    exit;
}

$item_id = intval($_GET['id']);

// Fetch item and seller info
$query = "
    SELECT 
        items.id, 
        items.title, 
        items.description, 
        items.price, 
        items.category, 
        items.image_url, 
        items.user_id, 
        users.first_name, 
        users.last_name, 
        users.email
    FROM items 
    JOIN users ON items.user_id = users.id
    WHERE items.id = ?
";

$stmt = $conn->prepare($query);
$stmt->bind_param("i", $item_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result && $result->num_rows > 0) {
    $item = $result->fetch_assoc();
    echo json_encode($item);
} else {
    echo json_encode(['error' => 'Item not found']);
}
?>
