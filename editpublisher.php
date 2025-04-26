<?php
include "dbconn.php";

// Check if 'id' is set in the request


$id = isset($_REQUEST["id"]) ? $_REQUEST["id"] : null;
if (!$id) {
    die("Error: Reader ID not provided.");
}

$sql = "SELECT * FROM publisher WHERE publisher_id = ?";
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

<form action="updatepublisher.php" method="GET">
    <label for="id">Publisher ID:</label><br>
    <input type="text" id="id" name="id" readonly value="<?php echo htmlspecialchars($row["publisher_id"]); ?>"><br>

    <label for="pubname">Publisher Name:</label><br>
    <input type="text" id="pubname" name="pubname" readonly value="<?php echo htmlspecialchars($row["publisher_name"]); ?>"><br>

    <label for="pubaddress">Publisher Address:</label><br>
    <input type="text" id="pubaddress" name="pubaddress" readonly value="<?php echo htmlspecialchars($row["publisher_PublisherAddress"]); ?>"><br>

    <label for="pubphone">Publisher Phone:</label><br>
    <input type="text" id="pubphone" name="pubphone" value="<?php echo htmlspecialchars($row["publisher_PublisherPhone"]); ?>"><br>
    
    <label for="ldate">Last Release Date:</label><br>
    <input type="text" id="ldate" name="ldate" value="<?php echo htmlspecialchars($row["last_release"]); ?>"><br>

    <input type="hidden" name="id" value="<?php echo htmlspecialchars($row["publisher_id"]); ?>">
    <input type="submit" value="Submit">
</form>

