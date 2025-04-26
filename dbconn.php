<?php
header("Cache-Control: no-cache");
/* Database credentials. Assuming you are running MySQL */

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'u345732450_dbiswas');
define('DB_PASSWORD', 'Trishul#123');
define('DB_NAME', 'u345732450_dbiswasproject');
 
/* Attempt to connect to MySQL database */
$conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

error_reporting(E_ALL);
ini_set('display_errors', 1);
// Check connection
if($conn === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
echo "Connection to database successful!!!!";
?>
