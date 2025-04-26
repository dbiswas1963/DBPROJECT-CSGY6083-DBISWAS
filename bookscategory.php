<?php
include "dbconn.php";
include "menu1.php";
echo "<table border=1><tr><th>BOOKS CATEGORY</th> </tr>";
echo "<table border=1><tr><th>Category ID</th>
                          <th>Category Name</th>
                          <th>Category Status</th>
                          <th>Creation Date</th>
                          <th>Update Date</th>
                          </tr>";
$sql = "select * from books_category";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["category_ID"] . "</td><td>" . $row["Category_name"] . "</td><td>" . $row["catstatus"] . "</td><td>"  . $row["CreationDate"] . "</td><td>"
          . $row["UpdationDate"] 
          . "</td><td><a href='deletebookscategory.php?id=" . $row["category_ID"] . "'>Del</a>"
          . "</td><td><a href='editbookscategory.php?id=" . $row["category_ID"] . "'>Edit</a>"
          . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="addbookscategory.htm">Add New</a>
<a href="logout.php" class="btn btn-danger">Logout</a>

