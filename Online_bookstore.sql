-- Create table
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);
DROP TABLE IF EXISTS Customers;
CREATE TABLE customers(
	Customer_ID SERIAL PRIMARY KEY,
	NAME VARCHAR (100),
	Email VARCHAR (100),
	Phone VARCHAR(15),
	City VARCHAR(50),
	Country VARCHAR(150)
);
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC (10,2)	
);
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1)Retrieve all books in the "fiction" genre
SELECT * FROM Books
WHERE genre='Fiction'

-- 2) find books published after the year 1950:
SELECT * FROM Books
WHERE Published_Year >1950;

-- 3) list all the customer from the canada
SELECT * FROM Customers
WHERE country ='Canada'

-- 4)show order placed in November 2023;
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'

-- 5) Retrieve the total stock of books availabe
SELECT sum(stock)
AS total_stocks
FROM Books;

-- 6) find the detail of most expensive book
SELECT * FROM Books ORDER BY price DESC LIMIT 1;

-- 7) Show all the customer who ordered more than 2 quantity of a book:
SELECT * FROM Orders WHERE quantity > 2 ;

-- 8) Retrieve all orders where the total amount exceed $20:
SELECT * FROM Orders WHERE total_amount >20;

-- 9) list all genres availabe in the books table
SELECT DISTINCT genre FROM Books;

-- 10) find the book with the lowest stock
SELECT * FROM Books ORDER BY stock LIMIT 1;






















