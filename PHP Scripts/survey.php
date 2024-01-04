<?php

// Database connection parameters
$host = 'localhost';
$database = 'id21709302_ipark';
$username = 'id21709302_userar';
$password = 'Aya162003?';

// Get data from Flutter app using POST
$name = $_POST['name'] ?? '';
$familyName = $_POST['familyName'] ?? '';
$carType = $_POST['carType'] ?? '';
$carColor = $_POST['carColor'] ?? '';
$year = $_POST['year'] ?? '';
$phoneNumber = $_POST['phoneNumber'] ?? '';
$userId = $_POST['userId'] ?? 0;

// Connect to the database
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the survey data for the given user already exists
$result = $conn->query("SELECT * FROM survey WHERE user_id = $userId");
if ($result->num_rows > 0) {
    // Data exists, update the existing record
    $stmt = $conn->prepare("
        UPDATE survey 
        SET name = ?, family_name = ?, car_type = ?, car_color = ?, year = ?, phone_number = ?
        WHERE user_id = ?
    ");
    $stmt->bind_param("ssssiss", $name, $familyName, $carType, $carColor, $year, $phoneNumber, $userId);
} else {
    // Data doesn't exist, insert a new record
    $stmt = $conn->prepare("
        INSERT INTO survey (user_id, name, family_name, car_type, car_color, year, phone_number) 
        VALUES (?, ?, ?, ?, ?, ?, ?)
    ");
    $stmt->bind_param("isssiss", $userId, $name, $familyName, $carType, $carColor, $year, $phoneNumber);
}

// Execute the statement
if ($stmt->execute()) {
    echo "Survey data added/updated successfully";
} else {
    // Log the error instead of echoing it
    error_log("Error: " . $stmt->error);

    // Provide a generic error message to the client
    echo "Error: Unable to add/update survey data";
}

// Close the statement
$stmt->close();

// Close the database connection
$conn->close();
?>
