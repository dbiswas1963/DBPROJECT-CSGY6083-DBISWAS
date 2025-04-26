<?php
include "dbconn.php";

// Check if 'id' is set in the request


$id = isset($_REQUEST["id"]) ? $_REQUEST["id"] : null;
if (!$id) {
    die("Error: Reader ID not provided.");
}

$sql = "SELECT * FROM author WHERE author_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
} else {
    die("Error: Reader not found.");
}
?>

<form action="updateauthor.php" method="GET">
    <label for="id">Author ID:</label><br>
    <input type="text" id="id" name="id" readonly value="<?php echo htmlspecialchars($row["author_id"]); ?>"><br>

    <label for="fname">First Name:</label><br>
    <input type="text" id="fname" name="fname" readonly value="<?php echo htmlspecialchars($row["authfirst_name"]); ?>"><br>

    <label for="lname">Last Name:</label><br>
    <input type="text" id="lname" name="lname" readonly value="<?php echo htmlspecialchars($row["authlast_name"]); ?>"><br>

    <label for="adesc">Auth Description:</label><br>
    <input type="text" id="adesc" name="adesc" value="<?php echo htmlspecialchars($row["authdesc"]); ?>"><br>

    <input type="hidden" name="id" value="<?php echo htmlspecialchars($row["author_id"]); ?>">
    <input type="submit" value="Submit">
</form>

