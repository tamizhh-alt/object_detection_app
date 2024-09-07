import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'settings.dart'; // Import the settings page
import 'habitat.dart'; // Import the habitats page
import 'generalmode.dart'; // Import the GeneralMode screen

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterTts _flutterTts = FlutterTts();
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  // Function to speak the text
  Future<void> _speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  // Helper function for consistent gradient decoration
  BoxDecoration _uniformGradientDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.lightGreenAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      shape: BoxShape.circle,
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  Future<void> _initializeSpeech() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() {
        _isListening = false;
      });
    }
  }

  void _startListening(Function(String) onCommandRecognized) {
    _speech.listen(onResult: (result) {
      if (result.hasConfidenceRating && result.confidence > 0.5) {
        onCommandRecognized(result.recognizedWords);
      }
    });
  }

  void _stopListening() {
    _speech.stop();
  }

  void _toggleListening() {
    if (_isListening) {
      _stopListening();
      setState(() {
        _isListening = false;
      });
    } else {
      _startListening((command) {
        _handleCommand(command);
      });
      setState(() {
        _isListening = true;
      });
    }
  }

  void _handleCommand(String command) {
    if (command.contains('open mode')) {
      _speak("General Mode activated");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GeneralMode()), // Navigate to GeneralMode
      );
    } else if (command.contains('check habitats')) {
      _speak("Habitats activated");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HabitatsPage()), // Navigate to HabitatsPage
      );
    }
    // Add more command handling as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent, // Transparent app bar
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: _toggleListening,
                  child: Container(
                    width: 400,
                    height: 300,
                    decoration: _uniformGradientDecoration(),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.mic,
                              color: Colors.white, size: 50), // Microphone icon
                          Text(
                            'VOICE COMMAND',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24, // Larger text size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GeneralMode()), // Navigate to GeneralMode
                      );
                    },
                    child: Container(
                      width: 140,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lightGreenAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.camera_alt,
                                color: Colors.white, size: 30), // Camera icon
                            Text(
                              'GENERAL MODE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18, // Larger text size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _speak("Habitats activated");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HabitatsPage()), // Navigate to HabitatsPage
                      );
                    },
                    child: Container(
                      width: 140,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lightGreenAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.location_on,
                                color: Colors.white, size: 30), // Location icon
                            Text(
                              'HABITATS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18, // Larger text size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Home button at the bottom-left corner
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: IconButton(
                onPressed: () {
                  _speak("Entering Home");
                },
                icon: Icon(Icons.home),
                color: const Color.fromARGB(255, 62, 62, 62),
                iconSize: 40, // Larger icon size
              ),
            ),
          ),
          // Settings button at the bottom-right corner
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                  _speak("Opening settings");
                },
                icon: Icon(Icons.settings),
                color: const Color.fromARGB(255, 62, 62, 62),
                iconSize: 40, // Larger icon size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
