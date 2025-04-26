DELIMITER //

/* Retrieve the names, addresses, and number of books checked out for all borrowers who have more than four books checked out. */ 

DROP PROCEDURE IF EXISTS `BooksLoanedOut`//

CREATE PROCEDURE BooksLoanedOut(IN BooksCheckedOut INT)
BEGIN
    SELECT 
        Borrower.borrower_BorrowerName,
        Borrower.borrower_BorrowerAddress,
        COUNT(*) AS TotalBooksLoaned
    FROM 
        book_loans AS Loans
        INNER JOIN borrower AS Borrower 
            ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
    GROUP BY 
        Borrower.borrower_BorrowerName, 
        Borrower.borrower_BorrowerAddress
    HAVING 
        COUNT(*) >= BooksCheckedOut;
END //

DELIMITER ;

SET @p0='4'; CALL `BooksLoanedOut`(@p0);
