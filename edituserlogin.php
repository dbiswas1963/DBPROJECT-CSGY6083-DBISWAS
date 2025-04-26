<?php
include "dbconn.php";

$sql = "SELECT * FROM user_login where user_id = ?";
$id = $_REQUEST["id"];
$stmt = $conn->prepare($sql);
$stmt->bind_param("s",$id);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows >0) {
    $row = $result->fetch_assoc();
}
?>

<form action="updateuserlogin.php">
    <label for "user_id">User ID:</label><br>
    <input type="text" id="id" name="id" readonly=True value="<?php echo $row["user_id"]?>"><br>
    
    <label for "password">Password:</label><br>
    <input type="text" id="password" name="password" value="<?php echo $row["user_password"]?>"><br>
    
   <label for "reader">Reader ID:</label><br>
   <input type="text" id="reader" name="reader"  readonly=True value="<?php echo $row["reader_id"]?>"><br>
    
    <label for "alocked">Account Locked:</label><br>
    <input type="text" id="alocked" name="alocked"    value="<?php echo $row["Account_locked"]?>"><br>
    
    <label for "lsignin">Last Sign In:</label><br>
    <input type="text" id="lsignin" name="lsignin"  value="<?php echo $row["last_signin_onln"]?>"><br>
    
    <input type="hidden" id="id" name="id"  value="<?php echo $row["user_id"]?>"><br>
    <input type="submit" value="Submit">
</form>
