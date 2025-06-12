<?php
header('Content-Type: application/json');
require 'db.php';

$data = json_decode(file_get_contents("php://input"), true);
if (!isset($data['id'])) {
    echo json_encode(["success" => false, "error" => "Missing report ID"]);
    exit;
}

$id = (int)$data['id'];
$stmt = $conn->prepare("DELETE FROM reports WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();

echo json_encode(["success" => $stmt->affected_rows > 0]);
$stmt->close();
$conn->close();
?>