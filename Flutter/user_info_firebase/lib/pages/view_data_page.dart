import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_info_firebase/models/firebase_user_model.dart';
import 'package:user_info_firebase/services/user_firebase_service.dart';




class ViewDataPage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService(); // Firestore service instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Saved Data'), // App bar title
      ),
      body: StreamBuilder<List<UserFirebaseModel>>(
        stream: _firestoreService.getUsers(), // Stream of user data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading indicator
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error message
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found.')); // Show message if no data
          }

          final users = snapshot.data!; // List of users
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name ?? 'No Name'), // Display user name
                subtitle: Text(
                    'Age: ${user.age ?? 'N/A'}, Hobby: ${user.favouriteHobby ?? 'N/A'}'), // Display age and hobby
              );
            },
          );
        },
      ),
    );
  }
}
