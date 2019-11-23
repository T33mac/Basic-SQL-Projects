use db_biblioteca

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(100) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(100) NOT NULL,
	PublisherPhone VARCHAR(20)
);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (200,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
	REFERENCES PUBLISHER (PublisherName) 
);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (2000,1),
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	BorrowerPhone VARCHAR(20) 
);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL
	REFERENCES BOOKS(BookID),
	AuthorName VARCHAR(50) 
);

CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL
	REFERENCES BOOKS(BookID),
	BranchID INT NOT NULL
	REFERENCES LIBRARY_BRANCH(BranchID),
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL
	REFERENCES BOOKS(BookID),
	BranchID INT NOT NULL
	REFERENCES LIBRARY_BRANCH(BranchID),
	CardNo INT NOT NULL
	REFERENCES BORROWER(CardNo),
	DateOut DATE NULL,
	DateIn DATE NULL
);

INSERT INTO LIBRARY_BRANCH
	(BranchName, BranchAddress)
	VALUES
	('Sharpstown', '555 NW Freemont Ave.'),
	('Central', '1212 SW Grant St.'),
	('Eastside', '566 Ne Mormont Ave.'),
	('Metro', '1508 SW Clay St.')
;

INSERT INTO PUBLISHER
	(PublisherName, PublisherAddress, PublisherPhone)
	VALUES
	('Brake Press', 'PO Box 888, Portland, OR', '1-800-248-2020'),
	('Penguin', 'PO Box 999, Bergenfield, NJ', '1-800-253-6476'),
	('Ddongchim', 'PO Box 688, Philadelphia, PA', '1-800-654-9898')
;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('Catch-22', 'Brake Press'),('The Lost Tribe', 'Ddongchim'),('Abraham Lincoln: Vampire Hunter', 'Brake Press'),
	('Even Cowgirls get the Blues', 'Ddongchim'),('Argall', 'Ddongchim'),('The Snows of Kilimanjaro', 'Brake Press'),
	('One Flew over the Cuckoo''s Nest', 'Ddongchim'),('Ready Player One', 'Ddongchim'),('Another Roadside Attraction', 'Ddongchim'),
	('Making Money with Horsemeat', 'Penguin'),('How to Make Soup from Old Shoes', 'Brake Press'),('Delores Claiborne', 'Penguin'),
	('The Dead Zone', 'Penguin'),('Night People', 'Penguin'),('Neuromancer', 'Penguin'),
	('Slobbyknockers', 'Ddongchim'),('Making the Perfect Chicken Pie', 'Penguin'),('Descent of Man', 'Penguin'),
	('Finding the Perfect Festivus Pole', 'Ddongchim'),('A Scanner Darkly', 'Penguin'),('Confessions of a Crap Artist', 'Penguin')
;
	
INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	('200', 'Joseph Heller'),('201', 'Bobby Fischer'),('202', 'Seth Grahame-Smith'),
	('203', 'Tom Robbins'),('204', 'William T. Vollmann'),('205', 'Ernest Hemingway'),
	('206', 'Ken Kesey'),('207', 'Ernest Cline'),('208', 'Tom Robbins'),
	('209', 'Jimmie Rodgers'),('210', 'Maggie May'),('211', 'Stephen King'),
	('212', 'Stephen King'),('213', 'Barry Gifford'),('214', 'William Gibson'),
	('215', 'Tommy Punchkicker'),('216', 'Sally Foofighter'),('217', 'T.C. Boyle'),
	('218', 'Frank Costanza'),('219', 'Phillip K. Dick'),('220', 'Phillip K. Dick')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	('200', '1', '2'),('201', '1', '4'),('202', '1', '2'),('203', '1', '2'),
	('204', '1', '2'),('205', '1', '2'),('206', '1', '3'),('207', '1', '3'),
	('208', '1', '2'),('209', '1', '2'),('210', '1', '3'),('211', '1', '2'),
	('212', '1', '3'),('213', '1', '1'),('214', '1', '1'),('215', '1', '2'),
	('216', '1', '3'),('217', '1', '2'),('218', '1', '3'),('219', '1', '2'),
	('220', '1', '2'),
    ('200', '2', '2'),('201', '2', '3'),('202', '2', '2'),('203', '2', '2'),
	('204', '2', '2'),('205', '2', '2'),('206', '2', '3'),('207', '2', '2'),
	('208', '2', '2'),('209', '2', '2'),('210', '2', '3'),('211', '2', '4'),
	('212', '2', '4'),('213', '2', '2'),('214', '2', '2'),('215', '2', '2'),
	('216', '2', '3'),('217', '2', '2'),('218', '2', '3'),('219', '2', '2'),
	('220', '2', '2'),
	('200', '3', '2'),('201', '3', '3'),('202', '3', '2'),('203', '3', '2'),
	('204', '3', '2'),('205', '3', '2'),('206', '3', '3'),('207', '3', '3'),
	('208', '3', '2'),('209', '3', '2'),('210', '3', '3'),('211', '3', '2'),
	('212', '3', '3'),('213', '3', '2'),('214', '3', '1'),('215', '3', '2'),
	('216', '3', '3'),('217', '3', '2'),('218', '3', '3'),('219', '3', '2'),
	('220', '3', '2'),
	('200', '4', '2'),('201', '4', '3'),('202', '4', '2'),('203', '4', '2'),
	('204', '4', '2'),('205', '4', '2'),('206', '4', '3'),('207', '4', '3'),
	('208', '4', '2'),('209', '4', '2'),('210', '4', '3'),('211', '4', '2'),
	('212', '4', '3'),('213', '4', '2'),('214', '4', '2'),('215', '4', '2'),
	('216', '4', '3'),('217', '4', '2'),('218', '4', '3'),('219', '4', '2'),
	('220', '4', '2')
;

INSERT INTO BORROWER
	(fname, lname, Address, BorrowerPhone)
	VALUES
	('annie', 'smith','344 sw Clay Street, Portland, OR', '503-575-2323'),('lonnie', 'wright','573 nw Dane Ln., Portland, OR', '971-236-8745'),
	('benny', 'wittles','745 n Johnson Blvd., Beaverton, OR', '503-676-9365'),('gabriel', 'barnes','15 n Dolphin Lane, Portland, OR', '971-989-0045'),
	('tammy', 'jones','666 sw Catdog Road, Portland, OR', '971-787-4958'),('tommy', 'jones','88345 nw 13th Ave., Beverton, OR', '503-670-6704'),
	('freddie', 'mercury','300 1st. Street, Vancouver, WA', '360-789-2345'),('jack', 'black','455 se 12th Ave., Portland, OR', '971-782-0004'),
	('jack', 'white','542 e Main St., Hillsboro, OR', '503-780-5582'), ('billy', 'grippo','15155 nw Dolores Ln., Portland, OR', '971-704-5562')
;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateIn)
	VALUES
	('200', '2', '2002', '2019-11-15', '2019-11-22'),('209', '2', '2002', '2019-11-16', '2019-11-23'),('210', '2', '2002', '2019-11-15', '2019-11-22'),
	('214', '2', '2002', '2019-11-16', '2019-11-23'),('217', '2', '2002', '2019-11-15', '2019-11-22'),('203', '2', '2002', '2019-11-15', '2019-11-22'),
	
	('217', '3', '2003', '2019-11-20', '2019-11-26'),('210', '3', '2003', '2019-11-20', '2019-11-26'),('201', '3', '2003', '2019-11-20', '2019-11-26'),
	('218', '3', '2003', '2019-11-20', '2019-11-26'),('203', '3', '2003', '2019-11-20', '2019-11-26'),('205', '3', '2003', '2019-11-20', '2019-11-26'),

	('204', '3', '2005', '2019-11-17', '2019-11-24'),('218', '3', '2005', '2019-11-17', '2019-11-24'),('220', '3', '2005', '2019-11-17', '2019-11-24'),

	('201', '1', '2007', '2019-11-17', '2019-11-24'),('210', '1', '2007', '2019-11-17', '2019-11-24'),('218', '1', '2007', '2019-11-17', '2019-11-24'),
	('219', '1', '2007', '2019-11-17', '2019-11-24'),('200', '1', '2007', '2019-11-17', '2019-11-24'),('216', '1', '2007', '2019-11-17', '2019-11-24'),
	
	('212', '1', '2008', '2019-11-16', '2019-11-23'),('211', '1', '2008', '2019-11-16', '2019-11-23'),
	('210', '1', '2008', '2019-11-16', '2019-11-23'),('208', '1', '2008', '2019-11-16', '2019-11-23'),('207', '1', '2008', '2019-11-16', '2019-11-23'),
	('220', '1', '2008', '2019-11-16', '2019-11-23'),('218', '1', '2008', '2019-11-16', '2019-11-23'),('216', '1', '2008', '2019-11-16', '2019-11-23'),

	('201', '1', '2009', '2019-11-15', '2019-11-22'),('202', '1', '2009', '2019-11-16', '2019-11-23'),('203', '1', '2009', '2019-11-15', '2019-11-22'),
	('206', '1', '2009', '2019-11-16', '2019-11-23'),('210', '1', '2009', '2019-11-15', '2019-11-22'),('218', '1', '2009', '2019-11-20', '2019-11-26'),
    ('211', '1', '2009', '2019-11-15', '2019-11-22'),('212', '1', '2009', '2019-11-16', '2019-11-23'),('215', '1', '2009', '2019-11-15', '2019-11-22'),

	('206', '4', '2010', '2019-11-16', '2019-11-23'),('204', '4', '2010', '2019-11-15', '2019-11-22'),('220', '4', '2010', '2019-11-20', '2019-11-26'),
	('210', '4', '2010', '2019-11-16', '2019-11-23'),('208', '4', '2010', '2019-11-15', '2019-11-22'),('211', '4', '2010', '2019-11-16', '2019-11-23'),
	('203', '4', '2010', '2019-11-15', '2019-11-22'),('219', '4', '2010', '2019-11-16', '2019-11-23'),('218', '4', '2010', '2019-11-15', '2019-11-22'),

	('201', '3', '2010', '2019-11-15', '2019-11-22'),('206', '1', '2010', '2019-11-16', '2019-11-23'),('218', '3', '2010', '2019-11-15', '2019-11-22')
;

SELECT * FROM BOOK_COPIES
WHERE BranchID = 1;
SELECT * FROM BOOK_COPIES
WHERE BranchID = 2;
SELECT * FROM BOOK_COPIES
WHERE BranchID = 3;
SELECT * FROM BOOK_COPIES
WHERE BranchID = 4;

SELECT * FROM BOOK_LOANS
Where CardNo = 2002;

--practice selects

SELECT
	a1.Number_Of_Copies ,a2.Title ,a3.BranchName
	FROM BOOK_COPIES a1 
	INNER JOIN BOOKS a2 ON a2.BookID = a1.BookID
	INNER JOIN LIBRARY_BRANCH a3 ON a3.BranchID = a1.BranchID  --#1
	WHERE Title = 'The Lost Tribe'
	AND BranchName = 'Sharpstown'
;

SELECT
	a1.Number_Of_Copies ,a2.Title ,a3.BranchName
	FROM BOOK_COPIES a1 
	INNER JOIN BOOKS a2 ON a2.BookID = a1.BookID
	INNER JOIN LIBRARY_BRANCH a3 ON a3.BranchID = a1.BranchID  --#2
	WHERE Title = 'The Lost Tribe'
;

SELECT
	a1.fname, a1.lname, a1.CardNo
	FROM BORROWER a1
	FULL OUTER JOIN BOOK_LOANS a2 ON a2.CardNo = a1.CardNo     --#3
	WHERE DateOut IS NULL
;

SELECT
	a2.Title, a3.fname, a3.lname, a3.Address
	FROM BOOK_LOANS a1
	INNER JOIN BOOKS a2 ON a2.BookID = a1.BookID
	INNER JOIN BORROWER a3 ON a3.CardNo = a1.CardNo
	INNER JOIN LIBRARY_BRANCH a4 ON a4.BranchID = a1.BranchID  --#4
	WHERE DateIn = '2019-11-22'
	AND BranchName = 'Sharpstown'
;

SELECT COUNT(*) AS "Sharpstown Branch Loans"
	FROM BOOK_LOANS a1
	INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a1.BranchID  --#5
	WHERE BranchName = 'Sharpstown'
;

SELECT COUNT(*) AS "Central Branch Loans"
	FROM BOOK_LOANS a1
	INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a1.BranchID --#5
	WHERE BranchName = 'Central'
;

SELECT COUNT(*) AS "Eastside Branch Loans"
	FROM BOOK_LOANS a1
	INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a1.BranchID  --#5
	WHERE BranchName = 'Eastside'
;

SELECT COUNT(*) AS "Metro Branch Loans"
	FROM BOOK_LOANS a1
	INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a1.BranchID  --#5
	WHERE BranchName = 'Metro'
;


SELECT a1.fname, a1.lname, a1.Address, COUNT(ALL a2.CardNo) AS TotalBooks
	FROM BORROWER a1
	FULL OUTER JOIN BOOK_LOANS a2 ON a2.CardNo = a1.CardNo      --#6
	GROUP BY a1.fname, a1.lname, a1.Address
	HAVING COUNT(ALL a2.CardNo) > 5
;

SELECT a3.Title, a1.Number_Of_Copies
	FROM BOOK_COPIES a1
	INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a1.BranchID
	INNER JOIN BOOKS a3 ON a3.BookID = a1.BookID
	INNER JOIN BOOK_AUTHORS a4 ON a4.BookID = a3.BookID          --#7
	WHERE AuthorName = 'Stephen King'
	AND BranchName = 'Central'
;
