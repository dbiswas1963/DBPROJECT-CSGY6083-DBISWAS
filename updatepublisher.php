<?php
include "dbconn.php";

$sql = "update publisher set publisher_name = ?, publisher_PublisherAddress = ?, publisher_PublisherPhone = ?, last_release = ?  where publisher_id = ?";

$pubaddress = $_REQUEST["pubaddress"];
$pubname = $_REQUEST["pubname"];
$pubphone = $_REQUEST["pubphone"];
$ldate = $_REQUEST["ldate"];
$id = $_REQUEST["id"];

$stmt = $conn->prepare($sql);

$stmt->bind_param("sssss", $pubname, $pubaddress,$pubphone, $ldate,$id);

if($stmt->execute() === TRUE) {
    echo "<script>window.location.href = 'publisher.php'</script>";
}
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>