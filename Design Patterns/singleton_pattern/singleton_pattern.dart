class Database {
  // Private static instance of the Database class
  static Database? _instance;

  // Private constructor to prevent external instantiation
  Database._();

  // Factory method to provide access to the single instance
  factory Database.createDatabase() {
    
    if (_instance == null) {
      _instance = Database._();
      print("Database instance created.");
    } else {
      print("Database instance already exists.");
    }
    return _instance!;
  }

  // Example method to simulate database functionality
  void connect() {
    print("Connected to the database.");
  }
}

class Client {
  void checkSingletonPattern() {
    // Create two instances of Database
    Database db1 = Database.createDatabase();
    Database db2 = Database.createDatabase();

    // Check if both instances are the same
    (identical(db1, db2))?print("db1 and db2 are the same instance."):
    print("db1 and db2 are different instances.");
    
  

    // Use the database instance
    db1.connect();
    db2.connect();
  }
}

void main() {
  Client client = Client();
  client.checkSingletonPattern();
}