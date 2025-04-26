<?php
include "dbconn.php";

$sql = "insert into user_login (
        user_id,  
        user_password,  
    	reader_id,  
    	Account_locked, 
    	last_signin_onln)
	    VALUES (?,?,?,?,?)";

$id = $_REQUEST["id"];
$password = $_REQUEST["password"];
$reader = $_REQUEST["reader"];
$alocked = $_REQUEST["alocked"];
$lsignin = $_REQUEST["lsignin"];

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssis", $id, $password, $reader, $alocked,$lsignin);
if($stmt->execute() === TRUE) {
    echo "<script>window.location.href = 'userlogin.php'</script>";
}
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>