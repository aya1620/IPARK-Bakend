<?php

// Database connection parameters
$host = 'localhost';
$database = 'id21709302_ipark';
$username = 'id21709302_userar';
$password = 'Aya162003?';

// Connect to the database
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connection successful";  
}

// Get data from Flutter app using POST
$userId = $_POST['userId'] ?? 0; 
$parkingSpot = $_POST['parkingSpot'] ?? 0;
$reservationDate = $_POST['reservationDate'] ?? '';
$reservationTime = $_POST['reservationTime'] ?? '';

// Convert time to the correct format
$reservationTime = date("H:i:s", strtotime($reservationTime));

// Prepare the statement
$stmt = $conn->prepare("INSERT INTO parking (user_id, parking_spot, reservation_date, reservation_time) VALUES (?, ?, ?, ?)");

// Bind parameters
$stmt->bind_param("iiss", $userId, $parkingSpot, $reservationDate, $reservationTime);

// Execute the statement
if ($stmt->execute()) {
    echo "Reservation added successfully";
} else {
    // Log the error instead of echoing it
    error_log("Error: " . $stmt->error);

    // Provide a generic error message to the client
    echo "Error: Unable to add reservation";
}

// Close the statement
$stmt->close();

// Close the database connection
$conn->close();
?>
