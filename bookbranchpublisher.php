<?php
include "dbconn.php";
include "menu2.php";
echo "<table border=1><tr><th>BRANCH BOOKS PUBLISHER(VIEW)</th> </tr>";
echo "<table border=1><tr><th>Book Name</th>
                          <th>Book ISBN</th>
                          <th>Library Branch Name</th>
                          <th>Library Branch Address</th>
                          <th>Publisher Name</th>
                          <th>Publisher Address
                          </tr>";
$sql = "select * from branch_books_pub";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["book_name"] . "</td><td>" . $row["book_isbn"] . "</td><td>" . $row["branch_name"] . "</td><td>" . $row["branch_address"]  . "</td><td>"  . $row["publisher_name"] . "</td><td>"
        . $row["publisher_PublisherAddress"] 
        . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="logout.php" class="btn btn-danger">Logout</a>