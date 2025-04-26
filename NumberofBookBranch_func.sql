DELIMITER //

DROP FUNCTION IF EXISTS `NumberofBookBranch`//

DELIMITER //

DROP FUNCTION IF EXISTS `NumberofBookBranch`//

CREATE FUNCTION `NumberofBookBranch`(`pbranchid` INT) RETURNS int(11)
    DETERMINISTIC
BEGIN
  DECLARE sum_of_books INT;

  SET sum_of_books = (
    SELECT 
      SUM(b.book_copies_No_Of_copies)
    FROM 
      books a
      JOIN tbl_book_copies b ON a.book_id = b.book_copies_BookID
      JOIN branch c ON b.book_copies_BranchID = c.branch_id AND a.branch_id = c.branch_id
    WHERE 
      c.branch_id = pbranchid
  );

  RETURN sum_of_books;
END//
DELIMITER ;

SET @p0='6'; SELECT `NumberofBookBranch`(@p0) AS `NumberofBookBranch`;