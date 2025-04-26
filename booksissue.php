<?php
include "dbconn.php";
include "menu1.php";
echo "<table border=1><tr><th>BOOKS ISSUE DETAILS</th> </tr>";
echo "<table border=1><tr><th>ISSUE ID</th>
                          <th>Book ID</th>
                          <th>Issued TO</th>
                          <th>Issued ON</th>
                          <th>Return ON</th>
                          <th>Fine Amt</th>
                          <th>Fine Paid</th>
                          </tr>";
$sql = "select * from books_issue";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["issue_id"] . "</td><td>" . $row["book_id"] . "</td><td>" . $row["issued_to"] . "</td><td>" . $row["issued_on"] . "</td><td>"
          . $row["return_on"] . "</td><td>"  . $row["current_fine"] . "</td><td>"
          . $row["fine_paid"] 
          . "</td><td><a href='deletebooksissue.php?id=" . $row["issue_id"] . "'>Del</a>"
          . "</td><td><a href='editbooksissue.php?id=" . $row["issue_id"] . "'>Edit</a>"
          . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="addbooksissue.htm">Add New</a>
<a href="logout.php" class="btn btn-danger">Logout</a>
