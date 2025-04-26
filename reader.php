<?php
include "dbconn.php";
include "menu1.php";
echo "<table border=1><tr><th>READER DETAILS</th> </tr>";
echo "<table border=1><tr><th>Reader ID</th>
                          <th>First Name</th>
                          <th>Last Name</th>
                          <th>Phone Number</th>
                          <th>Email ID</th>
                          <th>Sign UP Date</th>
                          <th>Book Issed Cnt</th>
                          </tr>";
$sql = "select * from readers";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["reader_id"] . "</td><td>" . $row["first_name"] . "</td><td>" . $row["last_name"] . "</td><td>"  . $row["Phonenumber"] . "</td><td>"  . $row["mailID"] . "</td><td>"
          . $row["signup_date"] . "</td><td>" 
          . $row["books_issued_cnt"] 
          . "</td><td><a href='deletereader.php?id=" . $row["reader_id"] . "'>Del</a>"
          . "</td><td><a href='editreader.php?id=" . $row["reader_id"] . "'>Edit</a>"
          . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="addreader.htm">Add New</a>
<a href="logout.php" class="btn btn-danger">Logout</a>
