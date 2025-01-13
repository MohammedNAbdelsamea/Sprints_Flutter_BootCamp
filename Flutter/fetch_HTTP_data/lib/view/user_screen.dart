import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../models/user.dart';
import '../service/user.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserService _userService = UserService();
  List<User> _users = [];
  bool _isLoading = false;
  String _error = '';

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final users = await _userService.fetchUsers();
      setState(() {
        _users = users;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load users. Please try again.'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Retry',
            onPressed: _fetchUsers,
            textColor: Colors.white,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Directory'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  REdgeInsets.all(8.0.sp),
            child: ElevatedButton(
              onPressed: _fetchUsers,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50.w),
              ),
              child: Text('Fetch Users'),
            ),
          ),
          if (_isLoading)
            Center(child: CircularProgressIndicator())
          else if (_error.isNotEmpty)
            Center(
              child: Padding(
                padding:  REdgeInsets.all(16.0),
                child: Text(
                  _error,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return Card(
                    margin: REdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        child: Text(user.name[0]),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      title: Text(
                        user.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(user.email),
                      children: [
                        Padding(
                          padding:  REdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Username: ${user.username}'),
                              SizedBox(height: 8.h),
                              Text('Phone: ${user.phone}'),
                              Text('Website: ${user.website}'),
                              SizedBox(height: 8.h),
                              Text(
                                'Address:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${user.address.street}, ${user.address.suite}'),
                              Text('${user.address.city}, ${user.address.zipcode}'),
                              SizedBox(height: 8.h),
                              Text(
                                'Company:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(user.company.name),
                              Text(user.company.catchPhrase),
                              Text(user.company.bs),

                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}