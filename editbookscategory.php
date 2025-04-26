<?php
include "dbconn.php";

// Check if 'id' is set in the request


$id = isset($_REQUEST["id"]) ? $_REQUEST["id"] : null;
if (!$id) {
    die("Error: Reader ID not provided.");
}


$sql = "SELECT * FROM books_category WHERE category_ID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
} else {
    die("Error: Reader not found.");
}
?>

<form action="updatebookscategory.php" method="GET">
    <label for="id">Category ID:</label><br>
    <input type="text" id="id" name="id" readonly value="<?php echo htmlspecialchars($row["category_ID"]); ?>"><br>

    <label for="catname">Category Name:</label><br>
    <input type="text" id="catname" name="catname" readonly value="<?php echo htmlspecialchars($row["Category_name"]); ?>"><br>

    <label for="cstatus">Category Status:</label><br>
    <input type="text" id="cstatus" name="cstatus"  value="<?php echo htmlspecialchars($row["catstatus"]); ?>"><br>

    <label for="cdate">Creation Date:</label><br>
    <input type="text" id="cdate" name="cdate" value="<?php echo htmlspecialchars($row["CreationDate"]); ?>"><br>
    
    <label for="udate">Update Date:</label><br>
    <input type="text" id="udate" name="udate" value="<?php echo htmlspecialchars($row["UpdationDate"]); ?>"><br>

    <input type="hidden" name="id" value="<?php echo htmlspecialchars($row["category_ID"]); ?>">
    <input type="submit" value="Submit">
</form>

