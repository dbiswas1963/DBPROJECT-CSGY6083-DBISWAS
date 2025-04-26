<?php
include "dbconn.php";
include "menu_proc_func.php";

// Initialize variables
$numberOfBooks = null;
$branchName = null;

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $branchId = isset($_POST['branchid']) ? (int)$_POST['branchid'] : 0;

    // Connect to the database
    //$conn = new mysqli($host, $username, $password, $database);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Get the number of books using the function
    $stmt1 = $conn->prepare("SELECT NumberofBookBranch(?) AS NumberOfBooks");
    $stmt1->bind_param("i", $branchId);
    $stmt1->execute();
    $stmt1->bind_result($numberOfBooks);
    $stmt1->fetch();
    $stmt1->close();

    // Get the branch name from the branch table
    $stmt2 = $conn->prepare("SELECT branch_name FROM branch WHERE branch_id = ?");
    $stmt2->bind_param("i", $branchId);
    $stmt2->execute();
    $stmt2->bind_result($branchName);
    $stmt2->fetch();
    $stmt2->close();

    $conn->close();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Book Count by Branch</title>
</head>
<body>
    <h2>Check Number of Books in a Branch</h2>
    <form method="POST" action="">
        <label for="branchid">Enter Branch ID:</label>
        <input type="number" name="branchid" id="branchid" required>
        <button type="submit">Check</button>
    </form>

    <?php if ($numberOfBooks !== null && $branchName !== null): ?>
        <p><strong>Branch ID:</strong> <?= htmlspecialchars($branchId) ?></p>
        <p><strong>Branch Name:</strong> <?= htmlspecialchars($branchName) ?></p>
        <p><strong>Number of Books:</strong> <?= $numberOfBooks ?></p>
    <?php elseif ($_SERVER["REQUEST_METHOD"] === "POST"): ?>
        <p style="color:red;">Branch not found. Please enter a valid branch ID.</p>
    <?php endif; ?>
</body>
</html>
<a href="logout.php" class="btn btn-danger">Logout</a>

