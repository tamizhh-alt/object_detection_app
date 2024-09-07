import 'package:flutter/material.dart';
import 'splash_screen.dart';
// Import voice command-related libraries if needed

void main() {
  // Initialize any global services or configurations if necessary
  // For example, you could initialize a global instance of a voice command service here

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OmniSense',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial route
    );
  }
}
