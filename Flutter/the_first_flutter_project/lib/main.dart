import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Flutter Project',
      theme: ThemeData(primarySwatch: Colors.blue,
      fontFamily: 'Suwannaphum',
      ),
      home: const ImageDisplayPage(),
    );
  }
}

class ImageDisplayPage extends StatelessWidget {
  const ImageDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Color(0xff004EFE),
        title: const Text('My First Project',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         // SizedBox(height:screenHeight * 0.05),
          const Text(
            'Hello, Sprints!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xff004EFE)),
          ),
          SizedBox(height:screenHeight * 0.02),
          // First Image
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img.png',
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                ),
                SizedBox(width:screenWidth * 0.05),
                Image.network(
                  'https://imgs.search.brave.com/iJbBYb1Qt_QkcVOTuMjnNVx3asBwFyvJMDhEEjrZ7zA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/c3ByaW50cy5haS9z/dG9yZS85MDA1ODEz/OC8xNzI3MjcwNjM1/NjZmNDBlZWIyMTIz/ZC5wbmc',
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                ),

              ],
            ),
          ),

          SizedBox(height:screenHeight * 0.05),
          // Customized Text
          Center(
            child: const Text(
              'The two images are displayed',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xff004EFE)),
            ),
          ),
           SizedBox(height:screenHeight * 0.02),
          // Second Image

        ],
      ),
    );
  }
}
