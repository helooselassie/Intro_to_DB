-- Use the alx_book_store database
USE alx_book_store;

-- Create the authors table
CREATE TABLE IF NOT EXISTS AUTHORS (
    AUTHOR_ID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    AUTHOR_NAME VARCHAR(215) NOT NULL          -- Author Name
);

-- Create the books table
CREATE TABLE IF NOT EXISTS BOOKS (
    BOOK_ID INT AUTO_INCREMENT PRIMARY KEY,     -- Primary Key
    TITLE VARCHAR(130) NOT NULL,                -- Book Title
    AUTHOR_ID INT,                              -- Foreign Key referencing AUTHORS
    PRICE DOUBLE NOT NULL,                      -- Book Price
    PUBLICATION_DATE DATE,                      -- Publication Date
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID) ON DELETE CASCADE  -- Relationship to AUTHORS
);

-- Create the customers table
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    CUSTOMER_NAME VARCHAR(215) NOT NULL,        -- Customer Name
    EMAIL VARCHAR(215) UNIQUE NOT NULL,         -- Customer Email
    ADDRESS TEXT                                 -- Customer Address
);

-- Create the orders table
CREATE TABLE IF NOT EXISTS ORDERS (
    ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,     -- Primary Key
    CUSTOMER_ID INT,                             -- Foreign Key referencing CUSTOMERS
    ORDER_DATE DATE NOT NULL,                    -- Order Date
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID) ON DELETE CASCADE  -- Relationship to CUSTOMERS
);

-- Create the order_details table
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    ORDERDETAILID INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    ORDER_ID INT,                                 -- Foreign Key referencing ORDERS
    BOOK_ID INT,                                  -- Foreign Key referencing BOOKS
    QUANTITY DOUBLE NOT NULL,                     -- Quantity of Books Ordered
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE,   -- Relationship to ORDERS
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID) ON DELETE CASCADE       -- Relationship to BOOKS
);
