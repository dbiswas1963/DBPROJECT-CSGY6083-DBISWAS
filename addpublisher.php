<?php
include "dbconn.php";

$sql = "insert into publisher (
        publisher_id,  
        publisher_name,  
    	publisher_PublisherAddress,  
    	publisher_PublisherPhone, 
    	last_release) 
	    VALUES (?,?,?,?,?)";

$id = $_REQUEST["id"];
$pubname = $_REQUEST["pubname"];
$pubaddress = $_REQUEST["pubaddress"];
$pubphone = $_REQUEST["pubphone"];
$ldate = $_REQUEST["ldate"];


$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $id, $pubname, $pubaddress, $pubphone,$ldate);
if($stmt->execute() === TRUE) {
    echo "<script>window.location.href = 'publisher.php'</script>";
}
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>