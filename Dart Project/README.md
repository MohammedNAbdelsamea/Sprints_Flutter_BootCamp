
# **Library System**

## **Overview**
A simple Dart-based library management system that allows book borrowing, returning, and user management operations.

---

## **Features**
- **Book Management**:
  - Add, borrow, and return books.
- **User Management**:
  - Add and track library users.
- **Track Borrowed Books**:
  - Maintain a list of books currently borrowed.
- **Display System Information**:
  - Show details about books, users, and borrowed books.
- **Error Handling**:
  - Handles errors for invalid inputs (e.g., non-existent books or users).

---

## **Classes and Attributes**

### **1. Book Class**
**Purpose**: Represents a book in the library system.

#### **Attributes**:
`title` (*String*): The title of the book.
- id` (*int*): A unique identifier for the book.
- borrowed` (*bool*): The current borrowing status of the book (initially: false).

#### **Methods**:
- displayInfo()`: Prints book information, including title, ID, and borrowing status.

---

### **2. User Class**
**Purpose**: Represents a user of the library system.

#### **Attributes**:
- `name` (*String*): The name of the user.
- `id` (*int*): A unique identifier for the user.

#### **Methods**:
- `displayInfo()`: Prints user information, including name and ID.

---

### **3. LibrarySystem Class**
**Purpose**: The main class that manages the library operations.

#### **Attributes**:
- `books` (*List<Book>*): A collection of all books in the library.
- `users` (*List<User>*): A collection of all registered users.

#Methods:
- addBook(Book book)`: Adds a new book to the library.
- addUser(User user)`: Registers a new user in the library system.
- borrowBook(int bookId, int userId)`: Allows a user to borrow a book by ID.
- returnBook(int bookId)`: Processes the return of a borrowed book.
- displayAllBooks()`: Displays information about all books in the library.
- displayAllUsers()`: Displays information about all registered users.
- displayBorrowedBooks()`: Displays a list of currently borrowed books.



## **Example Usage**

1. Add books and users to the system:
   - Add a book (e.g., "Maths", ID: 1).
   - Register a user (e.g., "Mohamed", ID: 1).

2. Borrow and return books:
   - Borrow books using their IDs and user IDs.
   - Return books by specifying their IDs.

3. Display system details:
   - View all books, users, and borrowed books.

---

## **Sample Output**

Book 'Maths' added successfully!
Book 'Science' added successfully!
User 'Mohamed' added successfully!
User 'Nasser' added successfully!

Performing operations in the LIBRARY:
--------------------------------------------------
Book 'Maths' borrowed by Mohamed.
Book 'Science' borrowed by Mohamed.
Book 'Maths' returned successfully.
--------------------------------------------------

All Books:
Book Title: Maths, Book ID: 1, Borrowed Status: Not Borrowed (Available)
Book Title: Science, Book ID: 2, Borrowed Status: Borrowed
--------------------------------------------------

All Users:
User Name: Mohamed, User ID: 1
User Name: Nasser, User ID: 2
--------------------------------------------------

Borrowed Books:
Book Title: Science, Book ID: 2, Borrowed Status: Borrowed



# Author
[Mohammed Nasser]
