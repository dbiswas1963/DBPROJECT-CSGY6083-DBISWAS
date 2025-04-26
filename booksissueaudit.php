<?php
include "dbconn.php";
include "menu2.php";
echo "<table border=1><tr><th>BOOKS LOAN ISSUE AUDIT</th> </tr>";
echo "<table border=1><tr><th>Issue ID</th>
                          <th>Book ID</th>
                          <th>Issued to</th>
                          <th>Issued ON</th>
                          <th>Return ON</th>
                          <th>Current Fine</th>
                          <th>Fine Paid</th>
                          <th>Audit User</th>
                          <th>Audit Date</th>
                          <th>Audit Type</th>
                          </tr>";
$sql = "select * from books_issue_audit";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["issue_id"] . "</td><td>" . $row["book_id"] . "</td><td>" . $row["issued_to"] . "</td><td>" . $row["issued_on"] . "</td><td>" 
        . $row["return_on"] . "</td><td>"  . $row["current_fine"] . "</td><td>"  . $row["fine_paid"] . "</td><td>"  
        . $row["audit_user"] . "</td><td>" . $row["audit_date"] . "</td><td>"
        . $row["audit_type"] 
        . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="logout.php" class="btn btn-danger">Logout</a>