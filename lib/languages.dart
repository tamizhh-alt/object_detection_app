import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({super.key});

  @override
  _LanguagesPageState createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  final FlutterTts _flutterTts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _selectedLanguage = 'en-US'; // Default language

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  Future<void> _initializeSpeech() async {
    bool available = await _speech.initialize();
    if (available) {
      // Assuming English is available; adjust based on actual language support
      setState(() {
        _selectedLanguage = 'en-US';
      });
    }
  }

  void _setLanguage(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;
      _flutterTts.setLanguage(languageCode);
      // Configure STT language here if needed
      // _speech.setLanguage(languageCode); // Add if STT supports dynamic language setting
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Language for Text-to-Speech (TTS) and Speech-to-Text (STT):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('English'),
              leading: Radio<String>(
                value: 'en-US',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  if (value != null) {
                    _setLanguage(value);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Tamil'),
              leading: Radio<String>(
                value: 'ta-IN',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  if (value != null) {
                    _setLanguage(value);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement the action for saving the language preferences
                  print('Selected Language: $_selectedLanguage');
                  // You might want to save this preference in local storage or a backend
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
