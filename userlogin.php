<?php
include "dbconn.php";
include "menu1.php";

echo "<table border=1><tr><th>USERLOGIN Details</th> </tr>";
echo "<table border=1><tr>
    <th>User ID</th>
    <th>Password</th>
    <th>Reader ID</th>
    <th>Account Locked</th>
    <th>Last Signin</th>
</tr>";

$sql = "select * from user_login";
$result = $conn->query($sql);
if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["user_id"] . "</td><td>" . $row["user_password"] . "</td><td>"  . $row["reader_id"] . "</td><td>" .  $row["Account_locked"] . "</td><td>"
          . $row["last_signin_onln"] 
          . "</td><td><a href='deleteuserlogin.php?id=" . $row["user_id"] . "'>Del</a>"
          . "</td><td><a href='edituserlogin.php?id=" . $row["user_id"] . "'>Edit</a>"
          . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='5'>No records found</td></tr>";
}
echo "</table>";
$conn->close();
?>
<a href="adduserlogin.htm">Add New</a>
<a href="logout.php" class="btn btn-danger">Logout</a>