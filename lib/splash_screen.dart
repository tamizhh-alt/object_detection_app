import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'home_page.dart'; // Import your HomePage class

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Schedule a delay to transition to HomePage
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color of the splash screen
      body: Stack(
        children: <Widget>[
          // Centered logo in the middle of the screen
          Center(
            child: SizedBox(
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              child: Image.asset(
                  'assets/images/omnisense_logo.png'), // Splash screen image
            ),
          ),
          // Positioned team name at the bottom of the screen
          Positioned(
            bottom: 30, // Distance from the bottom of the screen
            left: 0,
            right: 0,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.black, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Text(
                'by CYBERKNIGHTS', // Team name
                textAlign: TextAlign.center, // Center the text horizontally
                style: TextStyle(
                  fontSize: 16, // Adjust font size as needed
                  fontWeight: FontWeight.bold, // Bold font
                  color: Colors.white, // Required for the ShaderMask
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
