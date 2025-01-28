import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_info_firebase/models/firebase_user_model.dart';
import 'package:user_info_firebase/pages/view_data_page.dart';
import 'package:user_info_firebase/services/user_firebase_service.dart';




class UserInfoForm extends StatefulWidget {
  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _nameController = TextEditingController(); // Controller for name field
  final TextEditingController _ageController = TextEditingController(); // Controller for age field
  final TextEditingController _hobbyController = TextEditingController(); // Controller for hobby field
  final FirestoreService _firestoreService = FirestoreService(); // Firestore service instance

  // Save user data to Firestore
  void _saveData() async {
    if (_formKey.currentState!.validate()) { // Validate form fields
      // Create a UserFirebaseModel object
      final user = UserFirebaseModel(
        name: _nameController.text,
        age: int.tryParse(_ageController.text),
        favouriteHobby: _hobbyController.text,
      );

      try {
        await _firestoreService.saveUserData(user); // Save data to Firestore
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data saved successfully!')), // Show success message
        );
        _nameController.clear(); // Clear name field
        _ageController.clear(); // Clear age field
        _hobbyController.clear(); // Clear hobby field
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving data: $e')), // Show error message
        );
      }
    }
  }

  // Navigate to the View Data page
  void _navigateToViewData() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewDataPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information Form'), // App bar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name'; // Validation message
                  }
                  return null;
                },
              ),
              // Age field
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age'; // Validation message
                  }
                  return null;
                },
              ),
              // Hobby field
              TextFormField(
                controller: _hobbyController,
                decoration: InputDecoration(labelText: 'Favourite Hobby'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your hobby'; // Validation message
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Save Data button
              ElevatedButton(
                onPressed: _saveData,
                child: Text('Save Data'),
              ),
              // View Data button
              ElevatedButton(
                onPressed: _navigateToViewData,
                child: Text('View Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}