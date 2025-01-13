import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';

// A service class to handle fetching and caching user data
class UserService {
  // Dio instance to make API requests
  final Dio _dio = Dio();

  // API endpoint to fetch user data
  final String _apiUrl = 'https://jsonplaceholder.typicode.com/users';

  // Key to store cached users in SharedPreferences
  final String _cacheKey = 'users_cache';

  // Fetch users from the API or cache
  Future<List<User>> fetchUsers() async {
    try {
      // Try to get cached data first
      final cachedData = await _getCachedUsers();
      if (cachedData.isNotEmpty) {
        print('Returning cached data');
        return cachedData;
      }

      // If no cached data, fetch from the API
      final response = await _dio.get(_apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        // Convert the API response to a list of User objects
        final users = data.map((json) => User.fromJson(json)).toList();

        // Cache the fetched user data
        await _cacheUsers(users);
        print('Fetched and cached new data');

        return users;
      } else {
        // Handle API errors
        throw DioException(
          requestOptions: RequestOptions(path: _apiUrl),
          error: 'Failed to load users',
        );
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      throw _handleDioError(e);
    } catch (e) {
      // Handle unexpected errors
      throw Exception('An unexpected error occurred: $e');
    }
  }

  // Cache the user data in SharedPreferences
  Future<void> _cacheUsers(List<User> users) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Convert each user to a JSON string and store it in SharedPreferences
      final userJsonList = users.map((e) => jsonEncode(e.toJson())).toList();
      await prefs.setStringList(_cacheKey, userJsonList);
    } catch (e) {
      print('Error caching users: $e');
    }
  }

  // Retrieve cached users from SharedPreferences
  Future<List<User>> _getCachedUsers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJsonList = prefs.getStringList(_cacheKey) ?? [];

      // Convert each JSON string back to a User object
      return userJsonList
          .map((jsonString) => User.fromJson(jsonDecode(jsonString)))
          .toList();
    } catch (e) {
      print('Error reading cache: $e');
      return [];
    }
  }

  // Check the cache status and print details
  Future<void> checkCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJsonList = prefs.getStringList(_cacheKey) ?? [];

      if (userJsonList.isEmpty) {
        print('Cache is empty');
      } else {
        print('Cache contains ${userJsonList.length} users');
        if (userJsonList.isNotEmpty) {
          print('Sample cached user: ${userJsonList[0]}');
        }
      }
    } catch (e) {
      print('Error checking cache: $e');
    }
  }

  // Clear the cached user data
  Future<void> clearCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_cacheKey);
      print('Cache cleared');
    } catch (e) {
      print('Error clearing cache: $e');
    }
  }

  // Handle different types of Dio errors and return appropriate exceptions
  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Exception('Connection timeout');
      case DioExceptionType.receiveTimeout:
        return Exception('Receive timeout');
      case DioExceptionType.badResponse:
        return Exception('Server error: ${e.response?.statusCode}');
      case DioExceptionType.connectionError:
        return Exception('No internet connection');
      default:
        return Exception('Network error occurred');
    }
  }
}
