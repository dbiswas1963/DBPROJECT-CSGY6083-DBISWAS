<?php
include "dbconn.php";

$sql = "insert into author (
        author_id,  
        authfirst_name,  
    	authlast_name,  
    	authdesc) 
	    VALUES (?,?,?,?)";

$id = $_REQUEST["id"];
$fname = $_REQUEST["fname"];
$lname = $_REQUEST["lname"];
$adesc = $_REQUEST["adesc"];

$stmt = $conn->prepare($sql);
$stmt->bind_param("ssss", $id, $fname, $lname, $adesc);
if($stmt->execute() === TRUE) {
    echo "<script>window.location.href = 'author.php'</script>";
}
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>