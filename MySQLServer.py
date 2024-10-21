import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (replace with your credentials)
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Selassie@Hel00@2024",
        )

        if mydb.is_connected():
            cursor = mydb.cursor()
            
            # Attempt to create the database (assumes failure if the database exists)
            try:
                cursor.execute("CREATE DATABASE alx_book_store")
                print("Database 'alx_book_store' created successfully!")
            except Error as e:
                # Handle the specific error for existing database gracefully
                if "1007" in str(e):
                    print("Database 'alx_book_store' already exists, no action needed.")
                else:
                    print(f"Error occurred: {e}")

            # Close the cursor
            cursor.close()

    except Error as e:
        print(f"Error: {e}")
    finally:
        if mydb.is_connected():
            mydb.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()
