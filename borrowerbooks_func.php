<?php
include "menu_proc_func.php";

// Function to call the MySQL stored function BorrowerBooks()

function getBorrowedBooksCount($borrowerName) {
 include "dbconn.php";  
    // Create connection
  //  $conn = new mysqli($host, $user, $pass, $db);

    // Check connection
    if ($conn->connect_error) {
        return "Connection failed: " . $conn->connect_error;
    }

    // Prepare SQL to call the stored function
    $stmt = $conn->prepare("SELECT BorrowerBooks(?) AS total_books");
    if (!$stmt) {
        return "SQL prepare error: " . $conn->error;
    }

    $stmt->bind_param("s", $borrowerName);
    $stmt->execute();
    $stmt->bind_result($totalBooks);
    $stmt->fetch();

    $stmt->close();
    $conn->close();

    return $totalBooks ?? 0;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Borrower Book Count</title>
</head>
<body>
    <h2>Check Borrowed Books</h2>

    <form method="POST" action="">
        <label for="borrowerName">Enter Borrower's Name:</label>
        <input type="text" name="borrowerName" id="borrowerName" required>
        <input type="submit" value="Check">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["borrowerName"])) {
        $borrowerName = $_POST["borrowerName"];
        $count = getBorrowedBooksCount($borrowerName);

        echo "<h3>Books borrowed by <strong>" . htmlspecialchars($borrowerName) . "</strong>: $count</h3>";
    }
    ?>
</body>
</html>
