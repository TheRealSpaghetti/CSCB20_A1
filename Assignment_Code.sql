---Student Name Michelle Guo  Student Number: 1006655219
---Student Name In Kim  Student Number: 69696969 <-- Fill this in
---Student Name Leon Lee  Student Number: 1007686121
--for some reason, SQLite often has foreign key constraints off by
--default, so we're goign to turn them back on
PRAGMA foreign_keys = ON;
--drop all the tables, so we get a fresh database each
--time we run this code (careful, this will delete
--your data)

--------USEFUL COMMANDS----------
--SELECT:SELECT * FROM Course WHERE semester='F';
--PROJECT: SELECT code, room FROM Course;

DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Wrote;
DROP TABLE IF EXISTS Reader;
DROP TABLE IF EXISTS Rating;

CREATE TABLE Author(
   id INTEGER,
   given_name TEXT,
   family_name TEXT,
   nationality TEXT,
   date_of_birth DATE
);
CREATE TABLE Book(
   id INTEGER,
   title TEXT,
   subtitle TEXT,
   date_of_publication DATE,
   publisher TEXT,
   num_pages INTEGER
);
CREATE TABLE Reader(
   user_name TEXT,
   e_mail TEXT,
   reading_goal INTEGER
);
CREATE TABLE Rating(
   user_name TEXT,
   book_id INTEGER,
   score INTEGER
);
CREATE TABLE Wrote(
   book_id INTEGER,
   author_id INTEGER
);
---INSERTING DATA HERE
INSERT INTO Author(id, given_name, family_name, nationality, date_of_birth)
VALUES
(45822378, 'Stephen', 'Covey', 'American', '1932-10-24'),
(75232496, 'Daniel', 'Kahneman', 'Israeli', '1934-03-05'),
(59433872, 'Eckhart', 'Tolle', 'German', '1948-02-16'),
(28436540, 'Timothy', 'Ferriss', 'American', '1977-07-20'),
(94024751, 'Eric', 'Ries', 'American', '1978-09-22'),
(62442834, 'Rosamund', 'Stone Zander', 'American', '1942-07-02'),
(62423834, 'Ben', 'Zander', 'American', '1939-03-08'),
(86143495, 'Mark', 'Manson', 'American', '1984-03-09'),
(17465328, 'Marie', 'Kondo', 'Japanese', '1984-10-09'),
(34978211, 'Paulo', 'Coelho', 'Brazilian', '1947-08-24'),
(42795122, 'Dale', 'Carnegie', 'American', '1888-11-24'),
(53821249, 'Gary', 'Chapman', 'American', '1938-01-10'),
(71938345, 'Norman', 'Vincent Peale', 'American', '1898-05-31'),
(30164524, 'Robert', 'Kiyosaki', 'American', '1947-04-08'),
(13204124, 'Harper', 'Lee', 'American', '1926-04-28'),
(13204242, 'Jane', 'Austen', 'British', '1775-12-16'),
(13204342, 'J.D.', 'Salinger', 'American', '1919-01-01'),
(13204433, 'F. Scott', 'Fitzgerald', 'American', '1896-09-24'),
(13204512, 'Douglas', 'Adams', 'British', '1952-03-11'),
(13204667, 'George', 'Orwell', 'British', '1903-06-25'),
(13204725, 'J.R.R.', 'Tolkien', 'British', '1892-01-03'),
(13204815, 'Herman', 'Melville', 'American', '1819-08-01'),
(13202923, 'James', 'Clear', 'American', '1986-01-22'),
(13202952, 'Octavia', 'Butler', 'American', '1947-06-22'),
(13202909, 'Neil', 'Gaiman', 'British', '1960-11-10');

INSERT INTO Book(id, title, subtitle, date_of_publication, publisher, num_pages)
VALUES
(458278, 'The 7 Habits of Highly Effective People', 'How To Develop Bad Habits While Being Highly Effective', '1989-08-15', 'Free Press', 381),
(752496, 'Thinking, Fast and Slow', 'How To Slow Down Your Thinking and Be More Confused', '2011-10-25', 'Farrar, Straus and Giroux', 499),
(593872, 'The Power of Now', 'How To Live In The Past And Future Without Regret', '1999-09-01', 'New World Library', 236),
(286540, 'The 4-Hour Work Week', 'How To Work 4 Hours A Week And Still Be Broke', '2007-04-24', 'Crown Publishing Group', 308),
(940751, 'The Lean Startup', 'How To Start A Fat Startup And Fail', '2011-09-13', 'Crown Business', 336),
(624834, 'The Art of Possibility', 'How To Give Up On Your Possibilities And Be Miserable', '2000-09-01', 'Penguin Books', 224),
(861495, 'The Subtle Art of Not Giving a F*ck', 'How To Give Too Many Fcks And Worry All The Time', '2016-09-13', 'HarperOne', 212),
(174658, 'The Life-Changing Magic of Tidying Up', 'How To Make Your Life More Chaotic And Unorganized', '2014-10-14', 'Ten Speed Press', 224),
(349782, 'The Alchemist', 'How To Turn Gold Into Dirt And Be Miserable', '1988-01-01', 'HarperCollins', 163),
(427951, 'How to Win Friends and Influence People', 'How To Lose Friends And Alienate People', '1936-10-01', 'Simon & Schuster', 291),
(538219, 'The 5 Love Languages', 'How To Speak The Wrong Love Language And Ruin Your Relationships', '1992-01-01', 'Northfield Publishing', 208),
(719385, 'The Power of Positive Thinking', 'How To Be Negative And Depressed All The Time', '1952-05-01', 'Prentice Hall Press', 240),
(301645, 'Rich Dad Poor Dad', 'How To Be A Poor Dad With A Rich Mindset', '1997-01-01', 'Warner Books', 207),
(132041, "To Kill a Mockingbird", "A Comprehensive Guide to Bird Hunting", '1960-07-11', "J. B. Lippincott & Co.", 281),
(132042, "Pride and Prejudice", "A Guide to Arrogance and Bias", "1813-01-28", "T. Egerton, Whitehall", 279),
(132043, "The Catcher in the Rye", "How to Save Your Crops from Those Pesky Rye Grasses", "1951-07-16", "Little, Brown and Company", 277),
(132044, "The Great Gatsby", "A Guide to Hosting the Best Parties of the Roaring Twenties", "1925-04-10", "Scribner's", 180),
(132045, "The Hitchhiker's Guide to the Galaxy", "How to Travel the Universe on a Shoestring Budget", "1979-10-12", "Pan Books", 193),
(132046, "1984", "A Guide to the Future of Dystopian Surveillance States", "1949-06-08", "Secker & Warburg", 328),
(132047, "The Hobbit", "How to Throw the Best Party in Middle-Earth", "1937-09-21", "George Allen & Unwin", 310),
(132048, "Moby-Dick", "A Guide to Whale Hunting and Revenge", "1851-10-18", "Harper & Brothers", 634),
(132029, 'Atomic Habits', 'How To Develop Good Habits When Launching Nuclear Weapons', '2018-10-16', 'Penguin Random House', 687),
(132339, 'Kindred', 'Why The Color Red is Kind', '1979-06-01', 'Doubleday', 288),
(902929, 'Good Omens', 'I literally have no idea what this is about', '1956-03-21', 'Doubleday', 687);

INSERT INTO Reader(user_name, e_mail, reading_goal)
VALUES
('Jim Bobby', 'jim.bobby@mail.utoronto.ca', 5),
('Samantha Johnson', 'samantha.johnson@mail.utoronto.ca', 8),
('Mark Lee', 'mark.lee@mail.utoronto.ca', 14),
('Emily Davis', 'emily.davis@mail.utoronto.ca', 2),
('David Chen', 'david.chen@mail.utoronto.ca', 17),
('Sarah Wilson', 'sarah.wilson@mail.utoronto.ca', 3),
('Daniel Kim', 'daniel.kim@mail.utoronto.ca', 11),
('Olivia Thompson', 'olivia.thompson@mail.utoronto.ca', 9),
('Jacob Brown', 'jacob.brown@mail.utoronto.ca', 1),
('Jessica Garcia', 'jessica.garcia@mail.utoronto.ca', 20),
('Ethan Hernandez', 'ethan.hernandez@mail.utoronto.ca', 7),
('Mia Jackson', 'mia.jackson@mail.utoronto.ca', 16),
('Andrew Nguyen', 'andrew.nguyen@mail.utoronto.ca', 10),
('Sophia Patel', 'sophia.patel@mail.utoronto.ca', 1),
('Matthew Lewis', 'matthew.lewis@mail.utoronto.ca', 4),
('Ava Robinson', 'ava.robinson@mail.utoronto.ca', 12),
('Ryan Walker', 'ryan.walker@mail.utoronto.ca', 15),
('Isabella Taylor', 'isabella.taylor@mail.utoronto.ca', 6),
('Jayden Martinez', 'jayden.martinez@mail.utoronto.ca', 19),
('Natalie Wright', 'natalie.wright@mail.utoronto.ca', 13),
('William Baker', 'william.baker@mail.utoronto.ca', 5);

INSERT INTO Rating(user_name, book_id, score)
VALUES
('Jim Bobby', 458278, 9),
('Jim Bobby', 902929, 10),
('Mia Jackson', 902929, 5),
('Mia Jackson', 458278, 5),
('Sophia Patel', 902929, 5),
('Mia Jackson', 132029, 10),
('Mia Jackson', 349782, 1),
('David Chen', 132339, 1),
('Ryan Walker', 349782, 3),
('Jessica Garcia', 902929, 5),
('Daniel Kim', 132045, 3),
('Sophia Patel', 427951, 7);

INSERT INTO Wrote(book_id, author_id)
VALUES
(458278, 45822378),
(752496, 75232496),
(593872, 59433872),
(286540, 28436540),
(940751, 94024751),
(624834, 62442834),
(861495, 86143495),
(174658, 17465328),
(349782, 34978211),
(427951, 42795122),
(538219, 53821249),
(719385, 71938345),
(301645, 30164524),
(132041, 13204124),
(132042, 13204242),
(132043, 13204342),
(132044, 13204433),
(132045, 13204512),
(132046, 13204667),
(132047, 13204725),
(132048, 13204815),
(132029, 13202923),
(132339, 13202952),
(902929, 13202952);

---add your queries here
SELECT "Query a: The titles of all books that have more than 500 
pages";
SELECT title FROM Book WHERE num_pages>500; 

SELECT "Query b: The full name of all authors of the book ";
--Your answer here

SELECT "Query c: Titles of all books that have at least one 
review with a score of 10 (duplicates allowed)";

CREATE VIEW scoreQuery AS SELECT * FROM Rating WHERE score = 10;

CREATE VIEW c AS SELECT * FROM scoreQuery JOIN Book WHERE Book.id = scoreQuery.book_id;

SELECT title from c;

SELECT "Query d: Titles of all books that have at least one 
review with a score of 10 (without duplicates)";
--Your answer here

SELECT "Query e: The e-mails of all users who rated books by ";

CREATE VIEW bookSelection AS SELECT * FROM Book JOIN Wrote WHERE Book.id = Wrote.book_id;

CREATE VIEW authorBook AS SELECT * FROM Author JOIN bookSelection WHERE Author.id = bookSelection.author_id;

CREATE VIEW octBooks AS SELECT * FROM authorBook WHERE authorBook.given_name = 'Octavia' and authorBook.family_name = 'Butler';

CREATE VIEW users AS SELECT * FROM Reader JOIN Rating WHERE Reader.user_name = Rating.user_name; 

CREATE VIEW query AS SELECT * FROM octBooks JOIN users WHERE octBooks.book_id = users.book_id; 

SELECT e_mail FROM query;

SELECT "Query f: The e-mails of all users who rated books by 
other than her book ";


CREATE VIEW toDelete AS SELECT * FROM query WHERE query.title = 'Kindred';

CREATE VIEW answer AS SELECT * FROM query EXCEPT SELECT * FROM toDelete;

SELECT e_mail FROM answer;

SELECT "Query g: The titles of all books published by authors 
older than ";
--Your answer here

SELECT "Query h: The user names of all users who rated higher 
than ";
--Your answer here

SELECT "Query i: The user names of all users whose number of sad
reviews is greater than their reading goal";
--Your answer here

SELECT "Query j: The user names of anyone who has given 2 
different ratings to the same book, and the title
of the book(s) in question";
--Your answer here

SELECT "Query k: The e-mails of all users along with the title of
their highest rated book";

--Your answer here
