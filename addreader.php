<?php
include "dbconn.php";

$sql = "insert into readers (
        reader_id,  
        first_name,  
    	last_name,  
    	Phonenumber, 
    	mailID,  
        signup_date,
	    books_issued_cnt) 
	    VALUES (?,?,?,?,?,?,?)";

$id = $_REQUEST["id"];
$fname = $_REQUEST["fname"];
$lname = $_REQUEST["lname"];
$phnumber = $_REQUEST["phnumber"];
$mailid = $_REQUEST["email"];
$sdate = $_REQUEST["supdate"];
$bissuecnt = $_REQUEST["bissuecnt"];

$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssssi", $id, $fname, $lname, $phnumber,$mailid,$sdate,$bissuecnt);
if($stmt->execute() === TRUE) {
    echo "<script>window.location.href = 'reader.php'</script>";
}
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>