<?php
// ✅ Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$host = "localhost"; // Make sure this is correct
$dbname = "e-shop"; // Ensure this matches your MySQL database name
$username = "root"; // Default MySQL username for XAMPP
$password = "admin"; // Default password is empty for XAMPP

// ✅ Debugging: Log before connection attempt
file_put_contents("debug_db.log", "Starting database connection...\n", FILE_APPEND);

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // ✅ Debugging: Log successful connection
    file_put_contents("debug_db.log", "Database connected successfully to e-shop!\n", FILE_APPEND);
} catch (PDOException $e) {
    // ✅ Debugging: Log database connection failure
    file_put_contents("debug_db.log", "Database connection failed: " . $e->getMessage() . "\n", FILE_APPEND);
    die("Database connection failed: " . $e->getMessage());
}
?>