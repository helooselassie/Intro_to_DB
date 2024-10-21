-- Get full description of the 'books' table
SELECT 
    COLUMN_NAME,
    COLUMN_TYPE 
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    TABLE_SCHEMA = 'alx_book_store' 
    AND TABLE_NAME = 'books';  -- Ensure 'books' is in lowercase
