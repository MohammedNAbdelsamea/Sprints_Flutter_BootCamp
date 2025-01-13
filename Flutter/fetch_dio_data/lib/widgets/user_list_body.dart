import 'package:fetch_dio_data/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/user.dart';

// A widget that displays the body of the user list screen
class UserListBody extends StatelessWidget {
  final bool isLoading; // Indicates if the data is being loaded
  final String error; // Stores any error message
  final List<User> users; // List of users to display
  final Future<void> Function() onRetry; // Callback function to retry loading data

  // Constructor to initialize the UserListBody with required parameters
  const UserListBody({
    Key? key,
    required this.isLoading,
    required this.error,
    required this.users,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator if the data is still being fetched
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    // Show an error message with a retry button if an error occurs
    if (error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error, style: TextStyle(color: Colors.red)),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: onRetry,
              child: Text('Retry'),
            ),
          ],
        ),
      );
    }

    // Display the list of users in a scrollable view with pull-to-refresh functionality
    return RefreshIndicator(
      onRefresh: onRetry,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index]; // Get the user at the current index
          return UserCard(user: user); // Display each user using the UserCard widget
        },
      ),
    );
  }
}
