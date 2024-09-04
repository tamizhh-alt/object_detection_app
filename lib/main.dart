import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(OmniSenseApp());
}

class OmniSenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OmniSense',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OmniSenseHomePage(),
    );
  }
}
