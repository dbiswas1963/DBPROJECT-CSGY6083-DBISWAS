<?php
include "dbconn.php";

$sql = "update author set authfirst_name = ?, authlast_name = ?, authdesc = ? where author_id = ?";

$adesc = $_REQUEST["adesc"];
$fname = $_REQUEST["fname"];
$lname = $_REQUEST["lname"];
$id = $_REQUEST["id"];

$stmt = $conn->prepare($sql);

$stmt->bind_param("ssss", $fname, $lname, $adesc,$id);

if($stmt->execute() === TRUE) {
    echo "<script>window.location.href = 'author.php'</script>";
}
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>
