<?php
header('Content-Type: application/json');
require 'db.php';

$result = $conn->query("SELECT * FROM reports");

$reports = [];
while ($row = $result->fetch_assoc()) {
    $reports[] = $row;
}

echo json_encode($reports);
$conn->close();
?>