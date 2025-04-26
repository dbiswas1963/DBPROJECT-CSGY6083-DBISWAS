<?php
include "dbconn.php";
include "menu1.php";
echo "<table border=1><tr><th>AUTHOR DETAILS</th> </tr>";
echo "<table border=1><tr><th>Author ID</th>
                          <th>First Name</th>
                          <th>Last Name</th>
                          <th>Author Description</th>
                          </tr>";
$sql = "select * from author";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["author_id"] . "</td><td>" . $row["authfirst_name"] . "</td><td>" . $row["authlast_name"] . "</td><td>"
          . $row["authdesc"] 
          . "</td><td><a href='deleteauthor.php?id=" . $row["author_id"] . "'>Del</a>"
          . "</td><td><a href='editauthor.php?id=" . $row["author_id"] . "'>Edit</a>"
          . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="addauthor.htm">Add New</a>
<a href="logout.php" class="btn btn-danger">Logout</a>

