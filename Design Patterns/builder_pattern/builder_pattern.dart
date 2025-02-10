// User class
class User {
  final String firstName;    // Required
  final String lastName;     // Required
  final int? age;           // Optional
  final String? phone;      // Optional

  // Private constructor that will be called by the builder
  User._builder(UserBuilder builder)
      : firstName = builder._firstName,
        lastName = builder._lastName,
        age = builder._age,
        phone = builder._phone;

  @override
  String toString() {
    return 'User info :\nFirst Name: $firstName,  Last Name: $lastName,  Age: $age,   Phone: $phone';
  }
}

// UserBuilder class
class UserBuilder {
  final String _firstName;   // Required
  final String _lastName;    // Required
  int? _age;                // Optional
  String? _phone;           // Optional

  // Constructor with required fields
  UserBuilder(this._firstName, this._lastName);

  // Builder methods for optional fields
  UserBuilder age(int age) {
    _age = age;
    return this;
  }

  UserBuilder phone(String phone) {
    _phone = phone;
    return this;
  }

  // Build method to create the User instance
  User build() {
    return User._builder(this);
  }
}

// Example usage
void main() {
  // Creating a user with all fields
  User user1 = UserBuilder('Mohamed', 'Nasser')
      .age(23)
      .phone('01150903601')
      .build();
  print(user1);

  // Creating a user with only required fields
  User user2 = UserBuilder('Omar', 'Saif')
      .build();
  print(user2);

  // Creating a user with required fields and age only
  User user3 = UserBuilder('Ahmed', 'Abdo')
      .age(25)
      .build();
  print(user3);
}