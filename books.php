<?php
include "dbconn.php";
include "menu1.php";
echo "<table border=1><tr><th>BOOKS Details</th> </tr>";
echo "<table border=1><tr><th>Book ID</th>
                          <th>ISBN</th>
                          <th>Book Name</th>
                          <th>Author ID</th>
                          <th>Publisher ID</th>
                          <th>Category ID</th>
                          <th>Branch ID</th>
                          <th>Version</th>
                          <th>Release Date</th>
                          <th>Available Date</th>
                          <th>Price</th>
                          <th>Is Available</th>
                          </tr>";
$sql = "select * from books";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["book_id"] . "</td><td>" . $row["book_isbn"] . "</td><td>" . $row["book_name"] . "</td><td>"  . $row["author_id"] . "</td><td>"
          . $row["publisher_id"] . "</td><td>"  . $row["category_id"] . "</td><td>"  . $row["branch_id"] . "</td><td>"  . $row["book_version"] . "</td><td>"  . $row["release_date"] . "</td><td>"
          . $row["available_from"] . "</td><td>"  . $row["BOOK_PRICE"] . "</td><td>"
          . $row["is_available"] 
          . "</td><td><a href='deletebooks.php?id=" . $row["book_id"] . "'>Del</a>"
          . "</td><td><a href='editbooks.php?id=" . $row["book_id"] . "'>Edit</a>"
          . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="addbooks.htm">Add New</a>
<a href="logout.php" class="btn btn-danger">Logout</a>