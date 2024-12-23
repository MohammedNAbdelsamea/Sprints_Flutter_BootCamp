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
      fontFamily: 'font',
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
        title: const Text('Sprints',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height:screenHeight * 0.05),
          const Text(
            'Hello, Sprints!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xff004EFE)),
          ),
          SizedBox(height:screenHeight * 0.02),
          // First Image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Center(
              child: Image.asset(
                'assets/images/image.png',
                height: screenHeight * 0.2,
                width: screenWidth * 0.4,
              ),
            ),
          ),
          SizedBox(height:screenHeight * 0.02),
          // Customized Text
          const Text(
            'Welcome To My 1st App!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xff004EFE)),
          ),
           SizedBox(height:screenHeight * 0.02),
          // Second Image
          Image.asset(
            'assets/images/sprints.jpg',
            height: screenHeight * 0.2,
            width: screenWidth * 0.4,
          ),
        ],
      ),
    );
  }
}
