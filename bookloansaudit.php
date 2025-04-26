<?php
include "dbconn.php";
include "menu2.php";
echo "<table border=1><tr><th>BOOKS LOANS AUDIT</th> </tr>";
echo "<table border=1><tr><th>Loan ID</th>
                          <th>Book Loan ID</th>
                          <th>Branch ID</th>
                          <th>Loan Card NO</th>
                          <th>Loan Date Out</th>
                          <th>Loan Due Date</th>
                          <th>Audit User</th>
                          <th>Audit Date</th>
                          <th>Audit Type</th>
                          </tr>";
$sql = "select * from book_loans_audit";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["book_loans_LoansID"] . "</td><td>" . $row["book_loans_BookID"] . "</td><td>" . $row["book_loans_BranchID"] . "</td><td>" . $row["book_loans_CardNo"] . "</td><td>" 
        . $row["book_loans_DateOut"] . "</td><td>"  . $row["book_loans_DueDate"] . "</td><td>" 
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
