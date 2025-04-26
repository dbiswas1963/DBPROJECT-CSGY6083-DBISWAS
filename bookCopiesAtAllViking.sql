DELIMITER //

/* How many copies of the book titled "Viking" are owned by the library branch whose name is "Sharpstown"? */

DROP PROCEDURE IF EXISTS `bookCopiesAtAllViking`//

CREATE PROCEDURE bookCopiesAtAllViking (
    IN bookTitle VARCHAR(70),
    IN branchName VARCHAR(70)
)
BEGIN
    SELECT 
        copies.book_copies_BranchID,
        branch.branch_name,
        copies.book_copies_No_Of_Copies,
        books.book_name 
    FROM 
        tbl_book_copies AS copies
        INNER JOIN books ON copies.book_copies_BookID = books.book_id
        INNER JOIN branch AS branch ON copies.book_copies_BranchID = branch.branch_id
    WHERE 
        books.book_name = bookTitle 
        AND branch.branch_name = branchName;
END //

DELIMITER ;

SET @p0='Viking'; SET @p1='Sharpstown'; CALL `bookCopiesAtAllViking`(@p0, @p1);