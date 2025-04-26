<?php
include "dbconn.php";

// Check if 'id' is set in the request


$id = isset($_REQUEST["id"]) ? $_REQUEST["id"] : null;
if (!$id) {
    die("Error: Reader ID not provided.");
}

$sql = "SELECT * FROM readers WHERE reader_id = ?";
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

<form action="updatereader.php" method="GET">
    <label for="id">Reader ID:</label><br>
    <input type="text" id="id" name="id" readonly value="<?php echo htmlspecialchars($row["reader_id"]); ?>"><br>

    <label for="fname">First Name:</label><br>
    <input type="text" id="fname" name="fname" readonly value="<?php echo htmlspecialchars($row["first_name"]); ?>"><br>

    <label for="lname">Last Name:</label><br>
    <input type="text" id="lname" name="lname" readonly value="<?php echo htmlspecialchars($row["last_name"]); ?>"><br>

    <label for="phnumber">Phone Number:</label><br>
    <input type="text" id="phnumber" name="phnumber" value="<?php echo htmlspecialchars($row["Phonenumber"]); ?>"><br>

    <label for="mailid">Mail ID:</label><br>
    <input type="text" id="mailid" name="mailid" value="<?php echo htmlspecialchars($row["mailID"]); ?>"><br>

    <label for="sdate">Signup Date:</label><br>
    <input type="text" id="sdate" name="sdate" value="<?php echo htmlspecialchars($row["signup_date"]); ?>"><br>

    <label for="bissuedcnt">Book Issued Cnt:</label><br>
    <input type="text" id="bissuedcnt" name="bissuedcnt" value="<?php echo htmlspecialchars($row["books_issued_cnt"]); ?>"><br>

    <input type="hidden" name="id" value="<?php echo htmlspecialchars($row["reader_id"]); ?>">
    <input type="submit" value="Submit">
</form>

