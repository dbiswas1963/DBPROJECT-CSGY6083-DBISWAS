-- Start a safe transaction for issuing a book
-- Preventing Concurrent Update Conflicts

DELIMITER $$

-- Drop if it already exists
DROP PROCEDURE IF EXISTS test_isolation_book_issue $$

-- Create the procedure
CREATE PROCEDURE test_isolation_book_issue (
    IN book_id_in INT,
    IN reader_in INT,
    OUT pstatus VARCHAR(50)
)
BEGIN
    DECLARE current_count INT DEFAULT 0;

    -- Set the isolation level
    SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    -- Start the transaction
    START TRANSACTION;

    -- Lock the reader's row and get current books issued count
    SELECT books_issued_cnt 
    INTO current_count
    FROM u345732450_dbiswasproject.readers 
    WHERE reader_id = reader_in
    FOR UPDATE;

    -- Conditional check
    IF current_count < 5 THEN
        -- Insert a new book issue
        INSERT INTO u345732450_dbiswasproject.books_issue
        (book_id, issued_to, issued_on, return_on, current_fine, fine_paid)
        VALUES (book_id_in, reader_in, CURDATE(), CURDATE(), 0.0, 0.0);

        -- Update issued count
        UPDATE u345732450_dbiswasproject.readers
        SET books_issued_cnt = books_issued_cnt + 1
        WHERE reader_id = reader_in;

        SET pstatus = 'Book Issued!!!';
    ELSE
        SET pstatus = 'No Book left!!!';
    END IF;

    -- Commit transaction
    COMMIT;
END $$

DELIMITER ;

-- Call the procedure and see the output
SET @p0 = 3;
SET @p1 = 1;
SET @p2 = '';

CALL test_isolation_book_issue(@p0, @p1, @p2);
SELECT @p2 AS pstatus;


/*
Why FOR UPDATE?
In a high isolation level like SERIALIZABLE, using FOR UPDATE ensures that no other transaction can read or update the same row until the current one finishes.

SERIALIZABLE	❌ Prevented	❌ Prevented	❌ Prevented
*/
