-- Use the alx_book_store database
USE alx_book_store;

-- Create the AUTHORS table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    author_name VARCHAR(215) NOT NULL          -- Author Name
);

-- Create the BOOKS table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,     -- Primary Key
    title VARCHAR(130) NOT NULL,                -- Book Title
    author_id INT,                              -- Foreign Key referencing Authors
    price DOUBLE NOT NULL,                      -- Book Price
    publication_date DATE,                      -- Publication Date
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE  -- Relationship to Authors
);

-- Create the CUSTOMERS table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    customer_name VARCHAR(215) NOT NULL,        -- Customer Name
    email VARCHAR(215) UNIQUE NOT NULL,         -- Customer Email
    address TEXT                                 -- Customer Address
);

-- Create the ORDERS table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,     -- Primary Key
    customer_id INT,                             -- Foreign Key referencing Customers
    order_date DATE NOT NULL,                    -- Order Date
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE  -- Relationship to Customers
);

-- Create the ORDER_DETAILS table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    order_id INT,                                 -- Foreign Key referencing Orders
    book_id INT,                                  -- Foreign Key referencing Books
    quantity DOUBLE NOT NULL,                     -- Quantity of Books Ordered
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,   -- Relationship to Orders
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE       -- Relationship to Books
);
