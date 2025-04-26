DELIMITER //

DROP FUNCTION IF EXISTS `BorrowerBooks`//

DELIMITER //

CREATE FUNCTION `BorrowerBooks`(`pborrowername` varchar(200)) RETURNS int(11)
    DETERMINISTIC
BEGIN
  DECLARE sum_of_books INT;

  SET sum_of_books = (
    select count(*) from borrower_book_view where borrower_BorrowerName = pborrowername);

  RETURN sum_of_books;
END//
DELIMITER ;
