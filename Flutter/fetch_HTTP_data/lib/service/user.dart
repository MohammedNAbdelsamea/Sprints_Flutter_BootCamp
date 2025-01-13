import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';



class UserService {
  // API endpoint URL for fetching users
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/users';


  /// Fetches users from the API
  Future<List<User>> fetchUsers() async {
    try {
      // Make GET request to the API
      final response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Decode the JSON response body
        final List<dynamic> jsonResponse = json.decode(response.body);

        // Convert each JSON object to a User model and return as a List
        return jsonResponse.map((json) => User.fromJson(json)).toList();
      } else {
        // Throw exception if status code is not 200
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      throw Exception('Error: $e');
    }
  }
}