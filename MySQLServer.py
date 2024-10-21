import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (replace with your credentials)
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Selassie@Hel00@2024",
            port="3306"
        )

        if mydb.is_connected():
            cursor = mydb.cursor()
            
            # Attempt to create the database using IF NOT EXISTS
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully or already exists.")
            
            # Close the cursor
            cursor.close()

    except mysql.connector.Error as e:
        print(f"Error: {e}")
    finally:
        if mydb.is_connected():
            mydb.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()
