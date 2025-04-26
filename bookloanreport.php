<?php
include "dbconn.php";
include "menu2.php";
echo "<table border=1><tr><th>BOOKS LOAN REPORT(VIEW)</th> </tr>";
echo "<table border=1><tr><th>Borrower Name</th>
                          <th>Borrower Address</th>
                          <th>Book Name</th>
                          <th>ISBN</th>
                          <th>Library Branch Name</th>
                          <th>Library Branch Address</th>
                          </tr>";
$sql = "select * from book_loan_view";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["borrower_BorrowerName"] . "</td><td>" . $row["borrower_BorrowerAddress"] . "</td><td>" . $row["book_name"] . "</td><td>" . $row["book_isbn"] 
        . "</td><td>" . $row["branch_name"] . "</td><td>"
        . $row["branch_address"] 
        . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="logout.php" class="btn btn-danger">Logout</a>