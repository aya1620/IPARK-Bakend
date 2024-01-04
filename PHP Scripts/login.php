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
    // Connection error
    $response = ['success' => false, 'message' => 'Connection failed'];
    echo json_encode($response);
    die();
}

// Get data from Flutter app using POST
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

// Validate email (optional)
$email = filter_var($email, FILTER_VALIDATE_EMAIL);

// Prepare the statement to retrieve the hashed password and userId for the provided email
$stmt = $conn->prepare("SELECT userId, password FROM signup WHERE email = ?");
$stmt->bind_param("s", $email);

// Execute the statement
if ($stmt->execute()) {
    // Store the result
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        // Email exists in the database, retrieve the userId and hashed password
        $stmt->bind_result($userId, $hashedPassword);
        $stmt->fetch();

        // Verify the password
        if (password_verify($password, $hashedPassword)) {
            // Password is valid, return the userId
            $response = ['success' => true, 'userId' => $userId];
            echo json_encode($response);
        } else {
            // Invalid password
            $response = ['success' => false, 'message' => 'Invalid password'];
            echo json_encode($response);
        }
    } else {
        // Email not found
        $response = ['success' => false, 'message' => 'Email not found'];
        echo json_encode($response);
    }
} else {
    // Error executing the statement
    error_log("Error: " . $stmt->error);
    $response = ['success' => false, 'message' => 'Error executing the statement'];
    echo json_encode($response);
}

// Close the statement
$stmt->close();

// Close the database connection
$conn->close();
?>
