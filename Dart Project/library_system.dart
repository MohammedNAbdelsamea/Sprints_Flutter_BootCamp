class Book{
  String title;
  int id;
  bool borrowed;
  Book({required this.title, required this.id,  this.borrowed=false});

  void displayInfo(){
    String borrowedStatus = borrowed ? 'Borrowed' : 'Not Borrowed (Available)';
    print( 'Book Title is: $title, Book ID is: $id, Borrowed Status: $borrowedStatus');
  }


}


class User {
  String name;
  int id;
  User({required this.name, required this.id});
  void displayInfo(){
    print('User Name: $name, User ID: $id');
  }
}

class LibrarySystem{
  List<Book> books = [];
  List<User> users = [];

  void addBook(Book book){
    books.add(book);
    print("Book '${book.title}' added successfully!");
  }

  void addUser(User user){
    users.add(user);
    print("User '${user.name}' added successfully");
  }

  bool borrowBook(int bookId, int userId){
    Book? book = books.firstWhere((element) => element.id == bookId, orElse: () => Book(title: 'Not Found', id: 0, borrowed: false));
    User? user = users.firstWhere((element) => element.id == bookId, orElse: () => User(name: 'Not existed user', id: 0));
    if(book.borrowed){
      print('${book.title} is already borrowed');
      return false;
    }
    if(bookId==0){
      print('Book not found');
      return false;
    }
    if(userId==0){
      print('User not found');
      return false;
    }

    else{
      book.borrowed = true;
      print("Book '${book.title}' borrowed by ${user.name}");
      return true;
    }
  }

  bool returnBook(int bookId){
    Book? book = books.firstWhere((element) => element.id == bookId, orElse: () => Book(title: 'Book Not Found', id: 0, borrowed: false));

    if (bookId == 0) {
      print('Book not found');
      return false;
    }

    if(book.borrowed){
      book.borrowed = false;
      print("Book '${book.title}' returned successfully");
      return true;
    }

    else{
      print('Book is not borrowed');
      return false;
    }
  }
  void displayAllBooks(){
    for(Book book in books){
      book.displayInfo();
    }
  }
  void displayAllUsers(){
    for(User user in users){
      user.displayInfo();
    }
  }
  void displayBorrowedBooks(){
    for(Book book in books){
      if(book.borrowed){
        book.displayInfo();
      }
    }
  }
}

void main(){
  LibrarySystem librarySystem = LibrarySystem();

  librarySystem.addBook(Book(title: 'Maths', id: 1, borrowed: false));
  librarySystem.addBook(Book(title: 'Science', id: 2, borrowed: false));
  librarySystem.addBook(Book(title: 'Programming', id: 3, borrowed: false));
  print('--------------------------------------------------\n');
  librarySystem.addUser(User(name: 'Mohamed', id: 1));
  librarySystem.addUser(User(name: 'Nasser', id: 2));
  librarySystem.addUser(User(name: 'Abdo', id: 3));

  print('\nPerforming operations in the LIBRARY:');
  print('--------------------------------------------------');
  librarySystem.borrowBook(1, 1);
  librarySystem.borrowBook(2, 1);
  librarySystem.borrowBook(3, 2);
  print('--------------------------------------------------');
  librarySystem.returnBook(2);
print('--------------------------------------------------');
  librarySystem.borrowBook(1, 2);
  print('--------------------------------------------------');
  print('All Books:');
   librarySystem.displayAllBooks();
  print('--------------------------------------------------');
  print('All Users:');
   librarySystem.displayAllUsers();
  print('--------------------------------------------------');
  print('Borrowed Books:');
  librarySystem.displayBorrowedBooks();
}
