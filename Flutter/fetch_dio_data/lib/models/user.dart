import 'package:fetch_dio_data/models/address.dart';
import 'package:fetch_dio_data/models/company.dart';

/// User model class representing a user from the JSONPlaceholder API
class User {
  final int id; // Unique identifier for the user
  final String name; // Full name of the user
  final String username; // Username of the user
  final String email; // Email address of the user
  final Address address; // Address object representing the user's address
  final String phone; // Phone number of the user
  final String website; // Website URL of the user
  final Company company; // Company object representing the user's company details

  // Constructor to initialize the User object with required parameters
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  // Method to convert the User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(), // Convert Address object to JSON
      'phone': phone,
      'website': website,
      'company': company.toJson(), // Convert Company object to JSON
    };
  }

  // Factory constructor to create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']), // Convert JSON to Address object
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']), // Convert JSON to Company object
    );
  }
}
