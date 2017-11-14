USE finalProject
GO

/*
DROP TABLE publisher, book_authors, book_copies, book, publisher, book, borrower, library_branch
*/

DROP Table book, publisher

CREATE TABLE book (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (101,1),
	Title VARCHAR(90),
	PublisherName VARCHAR (90) NOT NULL CONSTRAINT fk_book_PublisherName FOREIGN KEY REFERENCES publisher(Name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE book_authors (
	BookID INT NOT NULL CONSTRAINT fk_book_authors_BookID FOREIGN KEY REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(90)
);

CREATE TABLE publisher (
	Name VARCHAR(90) PRIMARY KEY NOT NULL,
	Address VARCHAR(90),
	Phone VARCHAR (90)
);

CREATE TABLE book_loans (
	BookID INT NOT NULL CONSTRAINT fk_book_loans_BookID FOREIGN KEY REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_book_loans_BranchID FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_book_loans_CardNO FOREIGN KEY REFERENCES borrower(CardNO) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut Date,
	DueDate Date
);

CREATE TABLE book_copies (
	BookID INT NOT NULL CONSTRAINT fk_book_copies_BookID FOREIGN KEY REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_book_copies_BranchID FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT
);

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	Name VARCHAR(90),
	Address VARCHAR(90),
	Phone VARCHAR(90)
);

CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(90),
	Address VARCHAR (90)
);

INSERT INTO book
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Holt Paperbacks'),
	('Behind Closed Doors', 'St. Martin Press'),
	('The Good Daughter', 'Paperback'),
	('The Alice Network', 'Resee Book'),
	('The Good Daughter', 'Paperback'),
	('My Husband Wife', 'A Novel'),
	('The Chemist', 'Little Brown'),
	('Get Your Sh*t Together', 'Little Brown'),
	('The Life Changing Magic of Tidyi', 'Kondos'),
	('The Inquisition', 'Feiwel & Friends'),
	('Everything I Never Told You', 'A Novel'),
	('Milk and Honey', 'Andrews McMeel Publishing'),
	('IT', 'Simon and Schuster'),
	('The Dark Tower I', 'Simon and Schuster'),
	('A Good Marriage', 'Simon and Schuster'),
	('The Shining', 'Simon and Schuster'),
	('Harry Potter and the Philosopher''s Stone', 'Raincoast'),
	('Harry Potter and the Chamber of Secrets', 'Raincoast'),
	('Harry Potter and the Prisoner of Azkaban', 'Raincoast'),
	('Harry Potter and the Goblet of Fire', 'Raincoast'),
	('Harry Potter and the Order of the Phoenix', 'Raincoast'),
	('Harry Potter and the Half-Blood Prince', 'Raincoast'),
	('Harry Potter and the Deathly Hallows', 'Raincoast')
;



INSERT INTO book_authors
	(BookID, AuthorName)
	VALUES
	(101, 'Edward Marriott'),
	(102, 'B. A. Paris'),
	(103, 'Karin Slaughter'),
	(104, 'Kate Quinn'),
	(105, 'Karin Slaughter'),
	(106, 'Jane Corry'),
	(107, 'Stephenie Meyer'),
	(108, 'Sarah Knight'),
	(109, 'Marie Kondo'),
	(110, 'Taran Matharu'),
	(111, 'Celeste Ng'),
	(112, 'Rupi Kaur'),
	(113, 'Stephen King'),
	(114, 'Stephen King'),
	(115, 'Stephen King'),
	(116, 'Stephen King'),
	(117, 'J. K. Rowling'),
	(118, 'J. K. Rowling'),
	(119, 'J. K. Rowling'),
	(120, 'J. K. Rowling'),
	(121, 'J. K. Rowling'),
	(122, 'J. K. Rowling'),
	(123, 'J. K. Rowling')
;

INSERT INTO publisher
	(Name, Address, Phone)
	VALUES
	('Holt Paperbacks', 'Holt Avenue', '123-456-7890'),
	('St. Martin Press', 'Martin Avenue', '234-567-8978'),
	('Paperback', 'Paper Avenue', '153-189-1872'),
	('Resee Book', 'Resee Avenue', '186-4451'),
	('A Novel', 'Novel Avenue', '010-181-1527'),
	('Little Brown', 'Brown Avenue', '01-285-1863'),
	('Kondos', 'Kondo Avenue', '01-416-2576'),
	('Feiwel & Friends', 'Friend Avenue', '123-159-2672'),
	('Andrews McMeel Publishing', 'Andrews Avenue', '519-998-8583'),
	('Simon and Schuster', 'Simon Avenue', '158-4134'),
	('Raincoast', 'Raincoast Avenue', '051-1581-1538')
;

INSERT INTO library_branch
	(BranchName, Address)
	VALUES
	('Finch', 'Finch Avenue'),
	('Central', 'Central Avenue'),
	('York Mills', 'York Mills Avenue'),
	('Lawrence', 'Lawrence Avenue'),
	('Sharpstown', 'Sharpstown Avenue')
;

INSERT INTO borrower
	(Name, Address, Phone)
	VALUES
	('Young Kim', 'Northtown Way', '647-454-7004'),
	('Kristina Lee', 'Hargrave Avenue', '647-123-4567'),
	('Ryan Lee', 'Ashville Avenue', '123-456-7894'),
	('Jason Lim', 'Hollywood Avenue', '416-297-4171'),
	('Sam Kim', 'York Avenue', '905-158-1893'),
	('Ian Kim', 'London Avenue', '519-189-7498'),
	('Andrew Choi', 'Price Avenue', '416-789-1985'),
	('Bob Smith', 'Fake Avenue', '647-197-4186'),
	('Nancy Harvard', 'Boston Avenue', '416-863-4951'),
	('James Glendon', 'University Avenue', '000-000-0000')
;

INSERT INTO book_copies
	(BookID, BranchID, No_Of_Copies)
	VALUES
	(101, 1, 6),
	(101, 2, 8),
	(101, 3, 7),
	(101, 4, 6),
	(101, 5, 9),
	(102, 1, 5),
	(102, 2, 6),
	(102, 3, 4),
	(102, 4, 7),
	(102, 5, 8),
	(103, 1, 10),
	(103, 2, 7),
	(103, 3, 6),
	(103, 4, 4),
	(103, 5, 4),
	(104, 1, 8),
	(104, 2, 8),
	(104, 3, 7),
	(104, 4, 7),
	(104, 5, 6),
	(105, 1, 5),
	(105, 2, 12),
	(105, 3, 13),
	(105, 4, 5),
	(105, 5, 6),
	(106, 1, 6),
	(106, 2, 8),
	(106, 3, 9),
	(106, 4, 7),
	(106, 5, 5),
	(107, 1, 4),
	(107, 2, 6),
	(107, 3, 8),
	(107, 4, 9),
	(107, 5, 4),
	(108, 1, 6),
	(108, 2, 5),
	(108, 3, 4),
	(108, 4, 7),
	(108, 5, 9),
	(109, 1, 5),
	(109, 2, 6),
	(109, 3, 5),
	(109, 4, 3),
	(109, 5, 5),
	(110, 1, 4),
	(110, 2, 3),
	(110, 3, 6),
	(110, 4, 8),
	(110, 5, 9),
	(111, 1, 5),
	(111, 2, 9),
	(111, 3, 7),
	(111, 4, 7),
	(111, 5, 8),
	(112, 1, 6),
	(112, 2, 5),
	(112, 3, 7),
	(112, 4, 9),
	(112, 5, 7),
	(113, 1, 5),
	(113, 2, 4),
	(113, 3, 5),
	(113, 4, 6),
	(113, 5, 7),
	(114, 1, 8),
	(114, 2, 6),
	(114, 3, 5),
	(114, 4, 6),
	(114, 5, 7),
	(115, 1, 8),
	(115, 2, 9),
	(115, 3, 6),
	(115, 4, 4),
	(115, 5, 5),
	(116, 1, 7),
	(116, 2, 8),
	(116, 3, 4),
	(116, 4, 5),
	(116, 5, 6),
	(117, 1, 4),
	(117, 2, 5),
	(117, 3, 6),
	(117, 4, 8),
	(117, 5, 9),
	(118, 1, 9),
	(118, 2, 6),
	(118, 3, 6),
	(118, 4, 5),
	(118, 5, 4),
	(119, 1, 8),
	(119, 2, 6),
	(119, 3, 4),
	(119, 4, 5),
	(119, 5, 3),
	(120, 1, 4),
	(120, 2, 8),
	(120, 3, 5),
	(120, 4, 4),
	(120, 5, 6),
	(121, 1, 4),
	(121, 2, 5),
	(121, 3, 8),
	(121, 4, 6),
	(121, 5, 4),
	(122, 1, 7),
	(122, 2, 4),
	(122, 3, 6),
	(122, 4, 8),
	(122, 5, 9),
	(123, 1, 3),
	(123, 2, 4),
	(123, 3, 3),
	(123, 4, 2),
	(123, 5, 2)
;

INSERT INTO book_loans
	(BookID, BranchID, CardNo, DateOut, DueDate)
	VALUES
	(101, 1, 1000, '10/5/2017', '10/12/2017'),
	(102, 1, 1000, '10/5/2017', '10/12/2017'),
	(103, 1, 1000, '10/5/2017', '10/12/2017'),
	(104, 1, 1000, '10/5/2017', '10/12/2017'),
	(105, 1, 1000, '10/5/2017', '10/12/2017'),
	(106, 1, 1000, '10/5/2017', '10/12/2017'),
	(107, 2, 1000, '10/5/2017', '10/12/2017'),
	(108, 2, 1000, '10/5/2017', '10/12/2017'),
	(109, 2, 1000, '10/5/2017', '10/12/2017'),
	(110, 2, 1000, '10/5/2017', '10/12/2017'),
	(111, 3, 1000, '10/5/2017', '10/12/2017'),
	(112, 3, 1000, '10/5/2017', '10/12/2017'),
	(113, 3, 1000, '10/5/2017', '10/12/2017'),
	(114, 3, 1000, '10/5/2017', '10/12/2017'),
	(115, 3, 1000, '10/5/2017', '10/12/2017'),
	(116, 4, 1000, '10/5/2017', '10/12/2017'),
	(117, 4, 1000, '10/5/2017', '10/12/2017'),
	(118, 4, 1000, '10/5/2017', '10/12/2017'),
	(119, 5, 1000, '10/5/2017', '10/12/2017'),
	(120, 5, 1000, '10/5/2017', '10/12/2017'),
	(121, 5, 1000, '10/5/2017', '10/12/2017'),
	(122, 5, 1000, '10/5/2017', '10/12/2017'),
	(123, 5, 1000, '10/5/2017', '10/12/2017'),
	(117, 1, 1001, '10/5/2017', '10/12/2017'),
	(118, 1, 1001, '10/5/2017', '10/12/2017'),
	(119, 1, 1001, '10/5/2017', '10/12/2017'),
	(120, 1, 1001, '10/5/2017', '10/12/2017'),
	(121, 1, 1001, '10/5/2017', '10/12/2017'),
	(122, 1, 1001, '10/5/2017', '10/12/2017'),
	(123, 1, 1001, '10/5/2017', '10/12/2017'),
	(101, 2, 1001, '10/5/2017', '10/12/2017'),
	(102, 2, 1001, '10/5/2017', '10/12/2017'),
	(104, 1, 1002, '10/5/2017', '10/12/2017'),
	(108, 1, 1002, '10/5/2017', '10/12/2017'),
	(109, 1, 1002, '10/5/2017', '10/12/2017'),
	(114, 3, 1002, '10/5/2017', '10/12/2017'),
	(115, 3, 1002, '10/5/2017', '10/12/2017'),
	(116, 3, 1002, '10/5/2017', '10/12/2017'),
	(117, 3, 1002, '10/5/2017', '10/12/2017'),
	(102, 4, 1002, '10/5/2017', '10/12/2017'),
	(103, 5, 1002, '10/5/2017', '10/12/2017'),
	(106, 5, 1002, '10/5/2017', '10/12/2017'),
	(101, 1, 1003, '10/5/2017', '10/12/2017'),
	(102, 1, 1003, '10/5/2017', '10/12/2017'),
	(103, 1, 1003, '10/5/2017', '10/12/2017'),
	(104, 1, 1003, '10/5/2017', '10/12/2017'),
	(105, 1, 1003, '10/5/2017', '10/12/2017'),
	(101, 2, 1003, '10/5/2017', '10/12/2017'),
	(102, 2, 1003, '10/5/2017', '10/12/2017'),
	(103, 2, 1003, '10/5/2017', '10/12/2017'),
	(104, 2, 1004, '10/5/2017', '10/12/2017'),
	(105, 2, 1004, '10/5/2017', '10/12/2017'),
	(106, 2, 1004, '10/5/2017', '10/12/2017'),
	(107, 2, 1004, '10/5/2017', '10/12/2017'),
	(101, 3, 1004, '10/5/2017', '10/12/2017'),
	(102, 3, 1004, '10/5/2017', '10/12/2017'),
	(106, 1, 1005, '10/5/2017', '10/12/2017'),
	(101, 4, 1005, '10/5/2017', '10/12/2017'),
	(102, 4, 1005, '10/5/2017', '10/12/2017'),
	(101, 5, 1005, '10/5/2017', '10/12/2017'),
	(102, 5, 1005, '10/5/2017', '10/12/2017'),
	(103, 5, 1005, '10/5/2017', '10/12/2017'),
	(104, 5, 1005, '10/5/2017', '10/12/2017'),
	(107, 1, 1006, '10/5/2017', '10/12/2017'),
	(108, 2, 1006, '10/5/2017', '10/12/2017'),
	(103, 3, 1006, '10/5/2017', '10/12/2017'),
	(104, 3, 1006, '10/5/2017', '10/12/2017'),
	(105, 3, 1006, '10/5/2017', '10/12/2017'),
	(105, 5, 1007, '10/5/2017', '10/12/2017'),
	(106, 5, 1007, '10/5/2017', '10/12/2017'),
	(107, 5, 1007, '10/5/2017', '10/12/2017'),
	(108, 4, 1007, '10/5/2017', '10/12/2017'),
	(109, 4, 1007, '10/5/2017', '10/12/2017'),
	(111, 4, 1007, '10/5/2017', '10/12/2017'),
	(112, 4, 1007, '10/5/2017', '10/12/2017'),
	(113, 4, 1007, '10/5/2017', '10/12/2017'),
	(108, 1, 1008, '10/5/2017', '10/12/2017'),
	(108, 2, 1008, '10/5/2017', '10/12/2017'),
	(109, 2, 1008, '10/5/2017', '10/12/2017'),
	(110, 2, 1008, '10/5/2017', '10/12/2017'),
	(111, 2, 1008, '10/5/2017', '10/12/2017'),
	(112, 2, 1008, '10/5/2017', '10/12/2017'),
	(109, 1, 1009, '10/5/2017', '10/12/2017'),
	(113, 2, 1009, '10/5/2017', '10/12/2017'),
	(106, 3, 1009, '10/5/2017', '10/12/2017'),
	(103, 4, 1009, '10/5/2017', '10/12/2017'),
	(114, 5, 1009, '10/5/2017', '10/12/2017'),
	(115, 5, 1009, '10/5/2017', '10/12/2017'),
	(116, 5, 1009, '10/5/2017', '10/12/2017'),
	(117, 5, 1009, '10/5/2017', '10/12/2017')
;

SELECT * FROM book_authors
SELECT * FROM publisher
SELECT * FROM book_loans
SELECT * FROM book_copies
SELECT * FROM book
SELECT * FROM borrower
SELECT * FROM library_branch


--1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

SELECT book_copies.No_Of_Copies
FROM book_copies
INNER JOIN library_branch ON library_branch.BranchID = book_copies.BranchID
INNER JOIN book ON book.BookID = book_copies.BookID
WHERE library_branch.BranchName = 'Sharpstown' AND book.Title = 'The Lost Tribe'
;

--2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?

SELECT library_branch.BranchID, library_branch.BranchName, book_copies.No_Of_Copies
FROM book_copies
INNER JOIN library_branch ON library_branch.BranchID = book_copies.BranchID
INNER JOIN book ON book.BookID = book_copies.BookID
WHERE book.Title = 'The Lost Tribe'
;

--3. Retrieve the names of all borrowers who do not have any books checked out.

SELECT borrower.Name, COUNT(book_loans.CardNo)
FROM book_loans
INNER JOIN borrower ON book_loans.CardNo = borrower.CardNo
GROUP BY borrower.Name
HAVING COUNT(book_loans.CardNO) = 0
;

	--4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

SELECT book.Title, borrower.Name, borrower.Address
FROM book_loans
INNER JOIN book ON book.BookID = book_loans.BookID
INNER JOIN borrower ON borrower.CardNo = book_loans.CardNo
WHERE book_loans.DueDate = Convert(date, getdate()) 
;

--5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

SELECT library_branch.BranchName, SUM(book_copies.No_Of_Copies) AS 'Total Number of Checked Out Books'
FROM book_copies
INNER JOIN library_branch ON library_branch.BranchID = book_copies.BranchID
GROUP BY library_branch.BranchName
;

--6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.

SELECT borrower.Name, borrower.Address, COUNT(book_loans.CardNo) AS '# of Checked Out Books'
FROM book_loans
INNER JOIN borrower ON borrower.cardno = book_loans.cardno
GROUP BY book_loans.CardNo, borrower.Name, borrower.Address
HAVING COUNT(book_loans.CardNO) > 5

--7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

SELECT book.Title, book_copies.No_Of_Copies
FROM book
INNER JOIN book_authors ON book_authors.BookID = book.BookID
INNER JOIN book_copies ON book_copies.BookID = book.BookID
INNER JOIN library_branch ON library_branch.BranchID = book_copies.BranchID
WHERE book_authors.AuthorName = 'Stephen King' AND library_branch.BranchName = 'Central'
;