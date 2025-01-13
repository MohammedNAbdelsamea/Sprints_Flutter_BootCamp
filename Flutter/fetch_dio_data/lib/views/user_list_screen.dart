import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Importing necessary models, services, and widgets
import '../models/user.dart';
import '../service/user_service.dart';
import '../widgets/cach_info_banner.dart';
import '../widgets/user_list_body.dart';

// Main screen to display the list of users
class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

// State class for managing the user list screen
class _UserListScreenState extends State<UserListScreen> {
  // Service to fetch user data
  final UserService _userService = UserService();

  // Variables to manage loading state, errors, and user data
  bool _isLoading = false;
  String _error = '';
  List<User> _users = [];
  bool _isFromCache = false;

  @override
  void initState() {
    super.initState();
    // Load users when the screen initializes
    _loadUsers();
  }

  // Function to load users from the service
  Future<void> _loadUsers() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      // Check if there is cached data available
      await _userService.checkCache();
      // Fetch users from the service
      final users = await _userService.fetchUsers();
      setState(() {
        _users = users;
        _isLoading = false;
        _isFromCache = true;
      });
    } catch (e) {
      // Handle errors by showing the error message
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Directory'),
        actions: [
          // Button to clear cached data
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await _userService.clearCache();
              setState(() {
                _isFromCache = false;
              });
              // Show a message when cache is cleared
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cache cleared')),
              );
            },
          ),
          // Button to reload user data
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadUsers,
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner to show if data is loaded from cache or network
          CacheInfoBanner(isFromCache: _isFromCache),
          // Body of the screen displaying the user list or loading/error states
          Expanded(
            child: UserListBody(
              isLoading: _isLoading,
              error: _error,
              users: _users,
              onRetry: _loadUsers,
            ),
          ),
        ],
      ),
    );
  }
}
