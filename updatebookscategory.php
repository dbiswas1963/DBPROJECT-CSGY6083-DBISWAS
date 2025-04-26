<?php
include "dbconn.php";

$sql = "update books_category set Category_name = ?, catstatus = ?, CreationDate = ?,  UpdationDate = ?  where category_ID = ?";

$catname = $_REQUEST["catname"];
$cstatus = $_REQUEST["cstatus"];
$cdate = $_REQUEST["cdate"];
$udate = $_REQUEST["udate"];
$id = $_REQUEST["id"];

$stmt = $conn->prepare($sql);

$stmt->bind_param("ssssi", $catname, $cstatus,$cdate, $udate,$id);

if($stmt->execute() === TRUE) {
    echo "<script>window.location.href = 'bookscategory.php'</script>";
}
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>