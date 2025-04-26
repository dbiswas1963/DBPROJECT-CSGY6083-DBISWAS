<?php
session_start(); // Start the session

// Capture the referring application (if available)
$referrer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : 'Unknown';

// Unset all session variables
$_SESSION = array();

// Destroy the session
session_destroy();

// Remove session cookies (if set)
if (ini_get("session.use_cookies")) {
    setcookie(session_name(), '', time() - 42000, '/');
}

// Print referrer before redirecting
echo "Logged out of the application!<br>";
echo "You came from: <strong>" . htmlspecialchars($referrer, ENT_QUOTES, 'UTF-8') . "</strong>";

// Optional: Redirect after a delay
// header("refresh:3;url=login.php"); // Redirect after 3 seconds
// exit();
?>