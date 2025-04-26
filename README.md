# DBPROJECT-CSGY6083-DBISWAS

## Files
- `Library_Management_System.sql` — All Database Objects
- `Library_Management_System_Insert_Data.sql` — All Initial Data

## Database Tables

### Static Tables
- `branch`
- `author`
- `publisher`
- `borrower`
- `book_category`
- `readers`

### Dynamic Tables
- `books`
- `borrower_book_loans`
- `book_loans`
- `user_login`
- `books_issue`
- `tbl_book_copies`

### Audit Tables
- `book_loans_audit` — Tracks insert, update, delete in `book_loans`
- `books_issue_audit` — Tracks insert, update, delete in `books_issue`

### Triggers
 Triggers on table books_issue (target table books_issue_audit)
- after_books_issue_delete
- after_books_issue_update
- after_books_issue_insert

Triggers on table book_loans (target table book_loans_audit)
- after_delete_book_loans
- after_insert_book_loans
- after_update_book_loans
- set_due_date_book_loans


