<?php
include "dbconn.php";

try {
    // Validate inputs if needed
    $id = $_REQUEST["id"];
    $catname = $_REQUEST["catname"];
    $catstatus = $_REQUEST["catstatus"];
    $cdate = $_REQUEST["cdate"];
    $udate = $_REQUEST["udate"];

    $sql = "INSERT INTO books_category (
                category_ID,  
                Category_name,  
                catstatus,  
                CreationDate, 
                UpdationDate
            ) VALUES (?, ?, ?, ?, ?)";

    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("issss", $id, $catname, $catstatus, $cdate, $udate);

        if ($stmt->execute()) {
            echo "<script>window.location.href = 'bookscategory.php'</script>";
        } else {
            throw new Exception("Execute failed: " . $stmt->error);
        }

        $stmt->close();
    } else {
        throw new Exception("Prepare failed: " . $conn->error);
    }

} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}

$conn->close();
?>
