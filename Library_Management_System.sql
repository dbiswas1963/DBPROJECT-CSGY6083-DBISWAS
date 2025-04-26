/*SELECT USER(),CURRENT_USER();
SHOW GRANTS FOR lib_usr@localhost;
*/
USE u345732450_dbiswasproject; 

DROP TABLE IF EXISTS u345732450_dbiswasproject.branch;
CREATE TABLE u345732450_dbiswasproject.branch (
		branch_id INT PRIMARY KEY AUTO_INCREMENT,
		branch_name    VARCHAR(100) NOT NULL,
		branch_address VARCHAR(200) NOT NULL
	);
-- create the tables for the database

DROP TABLE IF EXISTS u345732450_dbiswasproject.author;
CREATE TABLE IF NOT EXISTS u345732450_dbiswasproject.author (
	author_id VARCHAR(255) PRIMARY KEY NOT NULL,
	authfirst_name VARCHAR(255),
	authlast_name VARCHAR(255),
	authdesc VARCHAR(255)
);

DROP TABLE IF EXISTS u345732450_dbiswasproject.publisher;
CREATE TABLE IF NOT EXISTS  u345732450_dbiswasproject.publisher (
	publisher_id VARCHAR(255) PRIMARY KEY NOT NULL,
    publisher_name VARCHAR(255) NOT NULL,
	publisher_PublisherAddress varchar(255) NOT NULL,
	publisher_PublisherPhone varchar(255) NOT NULL,
	last_release DATE);

---------------------------------------------------------

/*Category_ID, Category_name, catstatus, CreationDate, UpdationDate*/


/*Category_ID, Category_name, catstatus, CreationDate, UpdationDate*/

DROP TABLE IF EXISTS u345732450_dbiswasproject.books_category;
CREATE TABLE IF NOT EXISTS u345732450_dbiswasproject.books_category (
  category_ID INT(10) PRIMARY KEY NOT NULL,
  Category_name VARCHAR(255) NOT NULL,
  catstatus VARCHAR(1) DEFAULT NULL,
  CreationDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UpdationDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-------------------------------------------------------------------


DROP TABLE IF EXISTS u345732450_dbiswasproject.books;
CREATE TABLE IF NOT EXISTS u345732450_dbiswasproject.books (
		book_id 	INT PRIMARY KEY NOT NULL,
    	book_isbn 	VARCHAR(255),
    	book_name 	VARCHAR(255),
    	author_id VARCHAR(255) REFERENCES u345732450_dbiswasproject.author (author_id),
		publisher_id VARCHAR(255) REFERENCES u345732450_dbiswasproject.publisher (publisher_id),
		category_id  INT REFERENCES u345732450_dbiswasproject.books_category (category_id),
		branch_id   INT  NOT NULL  REFERENCES u345732450_dbiswasproject.branch (branch_id) ON UPDATE CASCADE,
    	book_version VARCHAR(255),
    	release_date DATE,
    	available_from DATE,
        BOOK_PRICE INT,
	    is_available BOOLEAN
);


DROP TABLE IF EXISTS u345732450_dbiswasproject.borrower;
CREATE TABLE u345732450_dbiswasproject.borrower(
		borrower_CardNo INT PRIMARY KEY AUTO_INCREMENT,
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerAddress VARCHAR(200) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL
	);
	
DROP TABLE IF EXISTS u345732450_dbiswasproject.borrower_book_loans;
CREATE TABLE u345732450_dbiswasproject.borrower_book_loans(
		borrower_CardNo INT REFERENCES u345732450_dbiswasproject.borrower(borrower_CardNo),
		book_loans_BookID INT REFERENCES u345732450_dbiswasproject.book_loans(book_loans_BookID)
	);

DROP TABLE IF EXISTS u345732450_dbiswasproject.book_loans;
CREATE TABLE u345732450_dbiswasproject.book_loans (
		book_loans_LoansID INT PRIMARY KEY auto_increment,
		book_loans_BookID INT NOT NULL REFERENCES u345732450_dbiswasproject.books(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_BranchID INT NOT NULL REFERENCES u345732450_dbiswasproject.branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_CardNo INT NOT NULL REFERENCES u345732450_dbiswasproject.borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_DateOut date NOT NULL,
		book_loans_DueDate date  NOT NULL
	);
	

DROP TABLE IF EXISTS u345732450_dbiswasproject.book_loans_audit;
CREATE TABLE u345732450_dbiswasproject.book_loans_audit (
		book_loans_LoansID INT,
		book_loans_BookID INT,
		book_loans_BranchID INT,
		book_loans_CardNo INT,
		book_loans_DateOut date,
		book_loans_DueDate date,
		audit_user  varchar(100),
		audit_date  TIMESTAMP,
		audit_type  varchar(25)
	);


	/*SELECT * FROM tbl_book_loans
	Use GETDATE() to retrieve the date values for Date out. Use DATEADD for the DueDate*/
	
	/*
	DROP TABLE IF EXISTS u345732450_dbiswasproject.book_copies;
	CREATE TABLE book_copies (
		book_copies_CopiesID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		book_copies_BookID INT NOT NULL REFERENCES book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_BranchID INT NOT NULL REFERENCES branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_No_Of_Copies INT NOT NULL
	);
	*/
    


DROP TABLE IF EXISTS u345732450_dbiswasproject.readers;
CREATE TABLE IF NOT EXISTS u345732450_dbiswasproject.readers (
	reader_id VARCHAR(255) PRIMARY KEY NOT NULL,
    first_name VARCHAR(255),
	last_name VARCHAR(255),
	Phonenumber VARCHAR(15),
	mailID VARCHAR(255),
	signup_date DATE,
	books_issued_cnt INT
/*	,last_issue_date DATE,
	current_fine FLOAT
	,is_issued BOOLEAN
	,bookts_issued_total
	,total_fine FLOAT,
	Fine_paid FLOAT		*/
);

DROP TABLE IF EXISTS u345732450_dbiswasproject.user_login;
CREATE TABLE IF NOT EXISTS u345732450_dbiswasproject.user_login (
	user_id VARCHAR(25) PRIMARY KEY NOT NULL,
	user_password VARCHAR(25) NOT NULL,
   	reader_id VARCHAR(255) NOT NULL,
	/*REFERENCES u345732450_dbiswasproject.readers (reader_id), */
	/*account_status BOOLEAN, */
	Account_locked BOOLEAN,
	last_signin_onln timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (reader_id) REFERENCES u345732450_dbiswasproject.readers(reader_id)
);


DROP TABLE IF EXISTS u345732450_dbiswasproject.books_issue;
CREATE TABLE IF NOT EXISTS u345732450_dbiswasproject.books_issue (
	issue_id INT PRIMARY KEY NOT NULL auto_increment,
	book_id  INT REFERENCES u345732450_dbiswasproject.books (book_id),
	issued_to VARCHAR(255) REFERENCES u345732450_dbiswasproject.readers (reader_id),
	issued_on DATE,
	return_on DATE,
	current_fine FLOAT,
	fine_paid FLOAT
);



DROP TABLE IF EXISTS u345732450_dbiswasproject.books_issue_audit;
CREATE TABLE IF NOT EXISTS u345732450_dbiswasproject.books_issue_audit (
	issue_id INT,  
	book_id  INT,  
	issued_to VARCHAR(255), 
	issued_on DATE,
	return_on DATE,
	actual_returnon DATE,
	current_fine FLOAT,
	fine_paid FLOAT,
	audit_user  varchar(100),
	audit_date  TIMESTAMP,
	audit_type  varchar(25)
);



DROP TABLE IF EXISTS u345732450_dbiswasproject.tbl_book_copies;
CREATE TABLE  u345732450_dbiswasproject.tbl_book_copies (
		book_copies_CopiesID INT PRIMARY KEY NOT NULL auto_increment,
		book_copies_BookID INT NOT NULL,
		book_copies_BranchID INT NOT NULL,
		book_copies_No_Of_Copies INT NOT NULL,
        FOREIGN KEY (book_copies_BookID)  REFERENCES u345732450_dbiswasproject.books(Book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (book_copies_branchID)  REFERENCES u345732450_dbiswasproject.branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE
	);


/*------- Views -----*/

create or REPLACE VIEW u345732450_dbiswasproject.branch_books_pub AS
select b.book_name,b.book_isbn,a.branch_name,a.branch_address,c.publisher_name, c.publisher_PublisherAddress
from u345732450_dbiswasproject.branch a, 
     u345732450_dbiswasproject.books b, 
	 u345732450_dbiswasproject.publisher c
where a.branch_id = b.branch_id
and   b.publisher_id = c.publisher_id;



create or REPLACE VIEW u345732450_dbiswasproject.book_loan_view AS
select  
       a.borrower_BorrowerName,
	   a.borrower_BorrowerAddress, 
	   d.book_name,
	   d.book_isbn,
	   e.branch_name,
	   e.branch_address
from u345732450_dbiswasproject.borrower a, 
     u345732450_dbiswasproject.borrower_book_loans b, 
	 u345732450_dbiswasproject.book_loans c,
	 u345732450_dbiswasproject.books d,
	 u345732450_dbiswasproject.branch e	 
where  c.book_loans_BookID = b.book_loans_BookID
and    c.book_loans_CardNo = b.borrower_CardNo
and    b.borrower_CardNo = a.borrower_CardNo
and    c.book_loans_BookID = d.book_id
and    d.branch_id = e.branch_id;

--- This is used in function BorrowerBooks

create or replace  view borrower_book_view as
select
       b.borrower_BorrowerName, 
       b.borrower_BorrowerAddress,
	   b.borrower_BorrowerPhone,
	   d.branch_name,
	   d.branch_address,
	   e.book_name,
       e.book_isbn,
       p.publisher_name,
       e.BOOK_PRICE,
       e.is_available
	   from 
	   borrower_book_loans a,
	   borrower b, 
	   book_loans c, 
	   branch d, 
	   books e,
       publisher p
where  a.borrower_CardNo = b.borrower_CardNo
and    a.book_loans_BookID = c.book_loans_BookID
and    c.book_loans_BookID = e.book_id
and    c.book_loans_BranchID = d.branch_id
and    e.publisher_id  = p.publisher_id;
	
/*------*/
ALTER TABLE u345732450_dbiswasproject.books
ADD CONSTRAINT fk_author_id
FOREIGN KEY (author_id) REFERENCES u345732450_dbiswasproject.author (author_id);

ALTER TABLE u345732450_dbiswasproject.books
ADD CONSTRAINT fk_publisher_id
FOREIGN KEY (publisher_id) REFERENCES u345732450_dbiswasproject.publisher (publisher_id);

ALTER TABLE u345732450_dbiswasproject.books
ADD CONSTRAINT fk_branch_id
FOREIGN KEY (branch_id) REFERENCES u345732450_dbiswasproject.branch (branch_id);

ALTER TABLE u345732450_dbiswasproject.books
ADD CONSTRAINT fk_category_id
FOREIGN KEY (category_id) REFERENCES u345732450_dbiswasproject.books_category (category_id);

/*----*/
ALTER TABLE u345732450_dbiswasproject.book_loans
ADD CONSTRAINT fk_book_loans_id
FOREIGN KEY (book_loans_BookID) REFERENCES u345732450_dbiswasproject.books(book_id);

ALTER TABLE u345732450_dbiswasproject.book_loans
ADD CONSTRAINT fk_book_loans_CardNo
FOREIGN KEY (book_loans_CardNo) REFERENCES u345732450_dbiswasproject.borrower(borrower_CardNo);

ALTER TABLE u345732450_dbiswasproject.book_loans
ADD CONSTRAINT fk_book_loans_branchid
FOREIGN KEY (book_loans_BranchID) REFERENCES  u345732450_dbiswasproject.branch(branch_id);

ALTER table u345732450_dbiswasproject.borrower_book_loans
ADD CONSTRAINT fk_bbl_1
FOREIGN KEY (borrower_CardNo) REFERENCES u345732450_dbiswasproject.borrower(borrower_CardNo);

ALTER table u345732450_dbiswasproject.borrower_book_loans
ADD CONSTRAINT fk_bbl_2
FOREIGN KEY (book_loans_BookID) REFERENCES u345732450_dbiswasproject.book_loans(book_loans_BookID);

/*-------*/

ALTER TABLE u345732450_dbiswasproject.books_issue
ADD CONSTRAINT fk_books_issue_id
FOREIGN KEY (book_id) REFERENCES u345732450_dbiswasproject.books (book_id);

ALTER TABLE u345732450_dbiswasproject.books_issue
ADD CONSTRAINT fk_books_reader_id
FOREIGN KEY (issued_to) REFERENCES u345732450_dbiswasproject.readers (reader_id);
/*------*/

---- FUBCTIONS -----

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
DELIMITER 

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

---------------------------------------------------------------
--------------------  TRIGGERs --------------------------------
--------------------------------------------------------------

DROP TRIGGER IF EXISTS `after_books_issue_delete`;

DELIMITER $$

CREATE OR REPLACE TRIGGER after_books_issue_delete
AFTER DELETE ON u345732450_dbiswasproject.books_issue
FOR EACH ROW
BEGIN
    INSERT INTO u345732450_dbiswasproject.books_issue_audit (
        issue_id, book_id, issued_to, issued_on, return_on, 
        current_fine, fine_paid, audit_type, audit_user, audit_date
    )
    VALUES (
        OLD.issue_id, OLD.book_id, OLD.issued_to, OLD.issued_on, OLD.return_on, 
        OLD.current_fine, OLD.fine_paid, 'DELETE', USER(), NOW()
    );
END$$


DELIMITER $$


DROP TRIGGER IF EXISTS `after_books_issue_update`;

CREATE OR REPLACE TRIGGER after_books_issue_update
AFTER UPDATE ON u345732450_dbiswasproject.books_issue
FOR EACH ROW
BEGIN
    INSERT INTO u345732450_dbiswasproject.books_issue_audit (
        issue_id, book_id, issued_to, issued_on, return_on, 
        current_fine, fine_paid, audit_type, audit_user, audit_date
    )
    VALUES (
        OLD.issue_id, OLD.book_id, OLD.issued_to, OLD.issued_on, OLD.return_on, 
        OLD.current_fine, OLD.fine_paid, 'UPDATE', USER(), NOW()
    );
END$$

DELIMITER $$

DROP TRIGGER IF EXISTS `after_books_issue_insert`;

DELIMITER $$

CREATE OR REPLACE TRIGGER after_books_issue_insert
AFTER INSERT ON u345732450_dbiswasproject.books_issue
FOR EACH ROW
BEGIN
    INSERT INTO u345732450_dbiswasproject.books_issue_audit (
        issue_id, book_id, issued_to, issued_on, return_on, 
        current_fine, fine_paid, audit_type, audit_user,audit_date
    )
    VALUES (
        NEW.issue_id, NEW.book_id, NEW.issued_to, NEW.issued_on, NEW.return_on, 
        NEW.current_fine, NEW.fine_paid, 'INSERT', USER(),now()
    );
END$$

DELIMITER $$

------

DROP TRIGGER IF EXISTS `after_delete_book_loans`;

DELIMITER //

CREATE TRIGGER `after_delete_book_loans`
AFTER DELETE ON `book_loans`
FOR EACH ROW 
BEGIN 
    INSERT INTO u345732450_dbiswasproject.book_loans_audit 
    (
        book_loans_LoansID, 
        book_loans_BookID, 
        book_loans_BranchID, 
        book_loans_CardNo, 
        book_loans_DateOut, 
        book_loans_DueDate, 
        audit_user, 
        audit_date,
        audit_type
    ) 
    VALUES 
    (
        OLD.book_loans_LoansID, 
        OLD.book_loans_BookID, 
        OLD.book_loans_BranchID, 
        OLD.book_loans_CardNo, 
        OLD.book_loans_DateOut, 
        OLD.book_loans_DueDate,
        USER(),
        NOW(),
        'DELETE'
    ); 
END;
//

DELIMITER ;


DROP TRIGGER IF EXISTS `after_update_book_loans`;

DELIMITER //

CREATE TRIGGER `after_update_book_loans`
AFTER UPDATE ON `book_loans`
FOR EACH ROW
BEGIN
    -- Log the update action
    INSERT INTO u345732450_dbiswasproject.book_loans_audit 
    (
        book_loans_LoansID, 
        book_loans_BookID, 
        book_loans_BranchID, 
        book_loans_CardNo, 
        book_loans_DateOut, 
        book_loans_DueDate, 
        audit_user, 
        audit_date, 
        audit_type
    ) 
    VALUES 
    (
        NEW.book_loans_LoansID, 
        NEW.book_loans_BookID, 
        NEW.book_loans_BranchID, 
        NEW.book_loans_CardNo, 
        NEW.book_loans_DateOut, 
        NEW.book_loans_DueDate, 
        USER(), 
        NOW(), 
        'UPDATE'
    );
END;
//

DELIMITER ;

DROP TRIGGER IF EXISTS `set_due_date_book_loans`;

DELIMITER //

CREATE TRIGGER `set_due_date_book_loans`
BEFORE INSERT ON `book_loans`
FOR EACH ROW
BEGIN
    -- Automatically set the DueDate to 7 days after DateOut if it's not provided
    IF NEW.book_loans_DueDate IS NULL THEN
        SET NEW.book_loans_DueDate = DATE_ADD(NEW.book_loans_DateOut, INTERVAL 7 DAY);
    END IF;
END;
//

DELIMITER ;

--------------------------------------------------------------------------------

/*
ALTER TABLE u345732450_dbiswasproject.readers
ADD CONSTRAINT fk_books_reader_id
FOREIGN KEY (reader_id) REFERENCES u345732450_dbiswasproject.(reader_id);
*/


SET SQL_SAFE_UPDATES = 0;
delete from u345732450_dbiswasproject.author;


