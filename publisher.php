<?php
include "dbconn.php";
include "menu1.php";
echo "<table border=1><tr><th>PUBLISHER DETAILS</th> </tr>";
echo "<table border=1><tr><th>Author ID</th>
                          <th>Publisher Name</th>
                          <th>Address</th>
                          <th>Phone Number</th>
                          <th>Last Release Date</th>
                          </tr>";
$sql = "select * from publisher";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["publisher_id"] . "</td><td>" . $row["publisher_name"] . "</td><td>" . $row["publisher_PublisherAddress"] . "</td><td>"  . $row["publisher_PublisherPhone"] . "</td><td>"
          . $row["last_release"] 
          . "</td><td><a href='deletepublisher.php?id=" . $row["publisher_id"] . "'>Del</a>"
          . "</td><td><a href='editpublisher.php?id=" . $row["publisher_id"] . "'>Edit</a>"
          . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="addpublish.htm">Add New</a>
<a href="logout.php" class="btn btn-danger">Logout</a>

