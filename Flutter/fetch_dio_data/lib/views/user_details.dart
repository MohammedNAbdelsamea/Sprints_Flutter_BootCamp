import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/user.dart';
import '../widgets/detail_row.dart';
import '../widgets/info_card.dart';

// A screen to display detailed user information
class UserDetailScreen extends StatelessWidget {
  final User user; // The user whose details will be displayed

  // Constructor to initialize the screen with user data
  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with the screen title
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(16), // Padding around the body content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
            children: [
              // Card to display basic user information
              InfoCard(
                title: 'Basic Information',
                children: [
                  DetailRow(label: 'Name:', value: user.name),
                  DetailRow(label: 'Username:', value: user.username),
                  DetailRow(label: 'Email:', value: user.email),
                  DetailRow(label: 'Phone:', value: user.phone),
                  DetailRow(label: 'Website:', value: user.website),
                ],
              ),
              SizedBox(height: 16.h), // Spacing between cards
              // Card to display user's address details
              InfoCard(
                title: 'Address',
                children: [
                  DetailRow(label: 'Street:', value: user.address.street),
                  DetailRow(label: 'Suite:', value: user.address.suite),
                  DetailRow(label: 'City:', value: user.address.city),
                  DetailRow(label: 'Zipcode:', value: user.address.zipcode),
                  DetailRow(
                    label: 'Coordinates:',
                    value: 'Lat: ${user.address.geo.lat}, Lng: ${user.address.geo.lng}',
                  ),
                ],
              ),
              SizedBox(height: 16.h), // Spacing between cards
              // Card to display user's company details
              InfoCard(
                title: 'Company',
                children: [
                  DetailRow(label: 'Name:', value: user.company.name),
                  DetailRow(label: 'Catch Phrase:', value: user.company.catchPhrase),
                  DetailRow(label: 'BS:', value: user.company.bs),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
