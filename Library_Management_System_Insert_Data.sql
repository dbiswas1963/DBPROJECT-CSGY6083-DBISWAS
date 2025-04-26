-------------------BRANCH(BT)-----------------------------
delete from u345732450_dbiswasproject.branch;
INSERT INTO u345732450_dbiswasproject.branch
		(branch_name,branch_address)
		VALUES
		('Sharpstown','32 Corner Road, New York, NY 10012'),
		('Central','491 3rd Street, New York, NY 10014'),
		('Saline','40 State Street, Saline, MI 48176'),
		('Ann Arbor','101 South University, Ann Arbor, MI 48104'),
		('North Edison', '550 Grove St, NJ 08820'),
		('South Edison', '123 GrandView St, NJ 08837');

commit;
		
SELECT * FROM u345732450_dbiswasproject.branch;
		
----------------------------AUTHOR(Base Tables)----------------------------
delete from u345732450_dbiswasproject.author;
INSERT INTO u345732450_dbiswasproject.author
		(author_id,authfirst_name,authlast_name,authdesc)
		VALUES
		('1','Patrick', 'Rothfuss', 'Novel Writer'),
		('2','Stephen', 'King', 'Fiction'),
		('3','Stephen', 'King', 'Comedy'),
		('4','Frank','Herbert','Comedy'),
		('5','J.R.R.','Tolkien', 'Novel Writer'),
		('6','Christopher','Paolini','Suspense'),
		('7','Patrick','Rothfuss','Thriller'),
		('8','J.K.','Rowling','Thriller'),
		('9','Haruki','Murakami','Fiction'),
		('10','Shel','Silverstein','Fiction'),
		('11','Douglas','Adams','War Dramma'),
		('12','Aldous','Huxley','War Dramma'),
		('13','William','Goldman','Sad Story'),
		('14','Chuck','Palahniuk','Illusionist'),
		('15','Louis','Sachar','Sad Story'),
		('16','J.K.','Rowling','Eulogy'),
		('17','Mark','Lee','Travel Story');
		
commit;

SELECT * FROM u345732450_dbiswasproject.author;
  
----------------------PUBLISHER(BT)--------------
delete from u345732450_dbiswasproject.publisher;
INSERT INTO u345732450_dbiswasproject.publisher
		(publisher_id,publisher_Name, publisher_PublisherAddress,publisher_PublisherPhone,last_release)
		VALUES
		('A1','DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000','2001-01-01'),
		('A2','Viking','375 Hudson Street, New York, NY 10014','212-366-2000','1987-01-02'),
		('A3','Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000','1969-03-05'),
		('B1','Chilton Books','Not Available','Not Available','1971-03-05'),
        ('B2','George Allen and Unwin','83 Alexander Ln, Crows Nest NSW 2065 Australia','61-2-8425-0100','1931-01-01'),
		('B3','Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390','1970-03-10'),		
		('C1','Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300','1965-02-03'),
		('C2','Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507','1945-05-07'),
		('C3','Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000','1987-05-05');
	
commit;
	
SELECT * FROM u345732450_dbiswasproject.publisher;

-----------------------------------------------------
delete from u345732450_dbiswasproject.books_category;
INSERT INTO u345732450_dbiswasproject.books_category
		(category_ID , Category_name,Catstatus)  
		VALUES
        (1,'Science fiction','A'),
		(2,'Romance novel','A'),
        (3,'Fantasy','A'),
		(4,'Horror','A'),
        (5,'Mystery','A'),
		(6,'Autobiography','A'),
		(7,'Historical fiction','A'),
		(8,'Thriller','B'),
		(9,'Literary fiction','B'),
		(10,'Action and adventure','B'),
		(11,'Biography','B'),
		(12,'Crime thriller','B'),
		(13,'Poetry','B'),
		(14,'Speculative fiction','B'),
		(15,'Dystopian','B'),
		(16,'Graphic novel','B'),
		(17,'Short story','B'),
		(18,'Young adultDrama','B'),
		(19,'Self-help book','B');
		
 commit;

SELECT * FROM u345732450_dbiswasproject.books_category;

----------------------BOOKS---------

delete from books;

INSERT INTO u345732450_dbiswasproject.books
		(book_id, book_isbn,book_name,author_id,publisher_id, category_id, branch_id,
		book_version,release_date,available_from,BOOK_PRICE,is_available)
		VALUES 
		(1,'111-222-444-555','The Name of the Wind','1','A1',1,1,'Version 3.1','2014-01-04','2025-04-20',200,True),
        (2,'111-222-444-111','Viking',             '2','A2',2,2,'Version 4.1','2012-01-04','2025-04-21',150,True),
		(3,'111-222-444-117','The Green Mile',     '3','A3',2,3,'Version 5.1','2012-02-04','2025-04-25',155,True),
		(4,'111-222-444-113','Dune',               '4','B1',3,5,'Version 5.1','2012-02-04','2025-04-25',170,True),
		(5,'111-222-444-114','The Hobbit',         '5','B2',2,6,'Version 6.1','2012-02-04',"",170,False),
        (6,'111-222-444-115','Eragon',             '6','B3',2,6,'Version 7.1','2012-02-05',"",175,False),
        (7,'111-222-444-116','A Wise Mans Fear',   '7','C1',4,5,'Version 8.1','2012-02-07',"",175,False),
		(8,'111-222-444-144','Harry Potter and the Philosophers Stone',        '8','C2',12,6,'Version 8.2','2012-02-20',"",175,False),
		(9,'111-222-444-118','Hard Boiled Wonderland and The End of the World','9','C3',9,6,'Version 8.3','2012-02-25',"",250,False),
		(10,'111-222-444-119','The Giving Tree','10','A1',19,6,'Version 8.7','2012-02-25',"",400,False),
        (11,'111-222-444-119','The Hitchhikers Guide to the Galaxy','11','A2',13,1,'Version 11.7','2012-02-25',"",500,False),
		(12,'111-222-444-120','Brave New World','12','A3',14,2,'Version 11.7','2012-02-25',"",550,False),
		(13,'111-222-444-127','The Princess Bride','13','A1',12,3,'Version 12.7','2012-02-25',"",130,False);		
commit;


select * from u345732450_dbiswasproject.books;	

select a.book_name,
       a.book_isbn,
       a.is_available,
       a.release_date,
       a.book_version,
       b.authfirst_name, 
       b.authlast_name,
       c.Category_name,
       d.branch_name,
       d.branch_address
       from books a, author b, books_category c, branch d
where a.author_id = b.author_id
and a.category_id = c.category_ID
and a.branch_id = d.branch_id

--------------------------BOOK_COPIES------------
/*
book_copies_BookID   ----->   books(Book_ID)
book_copies_branchID)  ----> branch(branch_id)
*/

delete from u345732450_dbiswasproject.tbl_book_copies;
	
INSERT INTO u345732450_dbiswasproject.tbl_book_copies
		(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
		VALUES
		('1','5','1'),
		('2','5','2'),
		('3','5','3'),
		('4','5','4'),
		('5','5','5'),
		('6','5','1'),
		('7','5','2'),
		('8','5','3'),
		('9','5','4'),
		('10','5','5'),
		('11','5','6'),
		('12','5','7'),
		('13','5','8'),
		('1','6','1'),
		('2','6','2'),
		('3','6','3'),
		('4','6','4'),
		('5','6','5'),
		('6','6','6'),
		('7','6','7'),
		('8','6','8'),
		('9','6','6'),
		('10','6','7'),
		('11','6','8'),
		('12','6','9'),
		('13','6','5'),
		('1','1','1'),
		('2','1','2'),
		('3','1','3'),
		('4','2','4'),
		('5','2','5'),
		('6','2','6'),
		('7','3','7'),
		('8','3','8'),
		('9','3','5'),
		('10','3','9'),
		('11','1','1'),
		('12','2','2'),
		('13','3','3'),
		('1','4','4'),
		('2','4','5'),
		('3','4','6'),
		('4','4','7'),
		('5','4','8'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','7'),
		('10','4','8'),
		('11','4','6'),
		('12','4','3'),
		('13','4','2');
		
select a.*, b.*, c.* 
from books a, tbl_book_copies b, branch c
where a.book_id = b.book_copies_BookID
and b.book_copies_BranchID = c.branch_id
and a.branch_id = c.branch_id

select a.book_name,c.branch_id, c.branch_name, max(b.book_copies_No_Of_copies)
from books a, tbl_book_copies b, branch c 
where a.book_id = b.book_copies_BookID 
and b.book_copies_BranchID = c.branch_id 
and a.branch_id = c.branch_id
group by a.book_name,c.branch_id


select c.branch_id, c.branch_name, sum(b.book_copies_No_Of_copies) 
from books a, tbl_book_copies b, branch c 
where a.book_id = b.book_copies_BookID and 
b.book_copies_BranchID = c.branch_id and 
a.branch_id = c.branch_id 
group by c.branch_id, c.branch_name;

CREATE function NumberofBookBranch(IN pbranchid int) returns int
begin
 SELECT 
    SUM(b.book_copies_No_Of_copies) AS book_copies 
  FROM 
    books a, 
    tbl_book_copies b, 
    branch c 
  WHERE 
    a.book_id = b.book_copies_BookID 
    AND b.book_copies_BranchID = c.branch_id 
    AND a.branch_id = c.branch_id 
    AND c.branch_id = 2
  GROUP BY 
    c.branch_id, 
    c.branch_name
) AS branch_summary;

CREATE function NumberofBookBranch(IN pbranchid int) returns int
begin
declare sum_of_books int;
set = (
 SELECT 
    SUM(b.book_copies_No_Of_copies) AS book_copies 
  FROM 
    books a, 
    tbl_book_copies b, 
    branch c 
  WHERE 
    a.book_id = b.book_copies_BookID 
    AND b.book_copies_BranchID = c.branch_id 
    AND a.branch_id = c.branch_id 
    AND c.branch_id = pbranchid
  GROUP BY 
    c.branch_id, 
    c.branch_name
)
		
-----------READERS-------------

delete from 345732450_dbiswasproject.readers;

insert into u345732450_dbiswasproject.readers
(reader_id,  
    first_name,  
	last_name,  
	Phonenumber, 
	mailID,  
	signup_date,
	books_issued_cnt)
VALUES
(1,'Dhiman','Biswas','9176085827','dbiswas@gmail.com','2021-01-30',1),
(2,'Krishna','Biswas','9082511118','kbiswas@gmail.com','2021-03-30',1),
(3,'Ani','Biswas','9087875007','anibiswas@gmail.com','2021-04-30',2),
(4,'Mohana','Biswas','9088215576','mbiswas@gmail.com','2021-05-30',2),
(5,'Medha','Ghosh','9088215578','mghosh@gmail.com','2021-06-30',2);

select * from u345732450_dbiswasproject.readers;

commit;

---------------------------------------------
---------------------USER_LOGIN-----------
--------------------------------------------

--reader_id   ------>  readers(reader_id)

delete from u345732450_dbiswasproject.user_login;
insert into u345732450_dbiswasproject.user_login
(user_id,user_password,reader_id,Account_locked,last_signin_onln)
VALUES
('Dbiswas','db1234',1,1,CURRENT_TIME()),
('Kbiswas','kb1234',2,1,CURRENT_TIME()),
('Mbiswas','mb1234',3,0,CURRENT_TIME()),
('Abiswas','ab1234',4,0,CURRENT_TIME());

commit;


select * from user_login;

---------------------------------------
--------------ONE2MANY-------------
--------------------------------------------

-----BORROWER -- They will Borrow using Library Card

delete from u345732450_dbiswasproject.borrower;
	
insert into u345732450_dbiswasproject.borrower
(borrower_BorrowerName, borrower_BorrowerAddress,borrower_BorrowerPhone)
values
('Shourab Roy','123 Drake ST, Long Beach, CA 08890','673-999-0101'),
('Shubrata Biswas','456 Loyal ST, BrantFord, OTTAWA 08890','767-999-0101'),
('Babu Mondal','999 Plamondon ST, Montral 09967','890-666-7777');

commit;

select * from u345732450_dbiswasproject.borrower;

delete from u345732450_dbiswasproject.book_loans;
insert into u345732450_dbiswasproject.book_loans
(book_loans_BookID,book_loans_BranchID,book_loans_CardNo,book_loans_DateOut,book_loans_DueDate)
values
(1, 4, 1,'2025-03-01','2025-05-25'),
(2, 5, 2,'2025-03-01','2025-06-25'),
(3, 6, 3,'2025-03-01','2025-07-25'),
(4, 7, 4,'2025-03-01','2025-07-25'),
(5, 7, 1,'2025-03-01','2025-07-25'),
(6, 7, 1,'2025-03-01','2025-07-25'),
(7, 7, 1,'2025-03-01',null),
(8, 7, 1,'2025-03-01',null),
(9, 7, 1,'2025-03-01',null);

commit;

select * from u345732450_dbiswasproject.book_loans;

delete from u345732450_dbiswasproject.borrower_book_loans;

insert into u345732450_dbiswasproject.borrower_book_loans
select a.borrower_CardNo,  b.book_loans_BookID from borrower a, book_loans b;

commit;

select * from u345732450_dbiswasproject.borrower_book_loans;
	
 

---------------------------------------------------------	
------------------BOOK ISSUE WITH TRIGGER------------
--------------------------------------------------

book_id ----> books(book_id)
issued_to ---> readers.(reader_id)
	
delete from u345732450_dbiswasproject.books_issue;

insert into u345732450_dbiswasproject.books_issue
(book_id,issued_to,issued_on,return_on,current_fine,fine_paid)
values
(1,1,'2025-03-01', '2025-03-01',0.0,0.0),
(1,2,'2025-03-01', '2025-03-01',0.0,0.0),
(2,1,'2025-03-01', '2025-03-01',0.0,0.0),
(2,2,'2025-03-01', '2025-03-01',0.0,0.0);

commit;

 