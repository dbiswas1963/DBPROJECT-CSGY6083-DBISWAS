<?php
include "dbconn.php";
include "menu_proc_func.php";
// Only process the form if it's submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $bookTitle = $_POST['bookTitle'] ?? '';
    $branchName = $_POST['branchName'] ?? '';

    // Database connection settings
    //$host = 'localhost';
   // $user = 'your_username';
   // $password = 'your_password';
   // $database = 'your_database';

   // $conn = new mysqli($host, $user, $password, $database);
    
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $stmt = $conn->prepare("CALL bookCopiesAtAllViking(?, ?)");
    $stmt->bind_param("ss", $bookTitle, $branchName);

    echo "<h2>Results for: <em>$bookTitle</em> at <em>$branchName</em></h2>";

    if ($stmt->execute()) {
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            echo "<table border='1' cellpadding='8' cellspacing='0'>";
            echo "<tr><th>Branch ID</th><th>Branch Name</th><th>No. of Copies</th><th>Book Name</th></tr>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                        <td>{$row['book_copies_BranchID']}</td>
                        <td>{$row['branch_name']}</td>
                        <td>{$row['book_copies_No_Of_Copies']}</td>
                        <td>{$row['book_name']}</td>
                      </tr>";
            }
            echo "</table>";
        } else {
            echo "No results found.";
        }
        $result->free();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>

<!-- HTML Form for Input -->
<!DOCTYPE html>
<html>
<head>
    <title>Book Lookup for Viking</title>
</head>
<body>
    <h1>Find Book Copies at a Branch</h1>
    <form method="post" action="">
        <label for="bookTitle">Book Title:</label>
        <input type="text" id="bookTitle" name="bookTitle" required><br><br>

        <label for="branchName">Branch Name:</label>
        <input type="text" id="branchName" name="branchName" required><br><br>

        <input type="submit" value="Search">
    </form>
</body>
</html>
<a href="logout.php" class="btn btn-danger">Logout</a>

