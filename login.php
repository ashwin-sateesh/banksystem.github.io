<?php
$servername = "localhost";
$username = "root";
$password = "Cosmicenergy24@";
$dbname = "banksystem";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$user = $_POST['username'];
$pass = $_POST['password'];

// SQL to check login
$sql = "SELECT * FROM login_details WHERE username='$user' AND password='$pass'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Redirect to main.html if login is successful
    header('Location: main.html');
} else {
    echo "Invalid username or password";
}

$conn->close();
?>
