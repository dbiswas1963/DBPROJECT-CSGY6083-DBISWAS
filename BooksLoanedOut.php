<?php
include "dbconn.php";
include "menu_proc_func.php";

// Get the input value from the form, or use default 4
$booksCheckedOut = isset($_POST['booksCheckedOut']) ? (int)$_POST['booksCheckedOut'] : 4;

// Check for DB connection errors
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Prepare the stored procedure call
$stmt = $conn->prepare("CALL BooksLoanedOut(?)");
$stmt->bind_param("i", $booksCheckedOut);

// Execute and get result
if ($stmt->execute()) {
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "<h3>Borrowers with at least $booksCheckedOut books loaned:</h3>";
        echo "<table border='1' cellpadding='8'>";
        echo "<tr><th>Borrower Name</th><th>Address</th><th>Total Books Loaned</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['borrower_BorrowerName']}</td>
                    <td>{$row['borrower_BorrowerAddress']}</td>
                    <td>{$row['TotalBooksLoaned']}</td>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "<p>No borrowers meet the criteria of $booksCheckedOut books checked out.</p>";
    }
    $result->free();
} else {
    echo "Execution failed: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>

<!-- Form for user input -->
<form method="post">
    <label>Minimum Books Checked Out: 
        <input type="number" name="booksCheckedOut" value="<?php echo htmlspecialchars($booksCheckedOut); ?>" required>
    </label>
    <input type="submit" value="Search">
</form>

<a href="logout.php" class="btn btn-danger">Logout</a>
