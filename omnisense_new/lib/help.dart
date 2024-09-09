import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Guidelines'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FAQs & Guidelines',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _faqSection(),
            const SizedBox(height: 20),
            _guidelinesSection(),
            const SizedBox(height: 20),
            _feedbackSection(),
          ],
        ),
      ),
    );
  }

  Widget _faqSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Frequently Asked Questions (FAQs):',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _faqItem('What is OmniSense?',
            'OmniSense is an app designed to assist visually impaired individuals by providing object detection, haptic feedback, and audio output to help them navigate their surroundings.'),
        _faqItem('How does OmniSense work?',
            'The app uses the camera to detect objects and the microphone for voice commands. It provides haptic and audio feedback to guide users.'),
        _faqItem('How do I activate the camera and microphone?',
            'You can use the "Activate Camera and Microphone" button on the homepage to enable both features simultaneously.'),
        _faqItem('What languages does OmniSense support?',
            'Currently, OmniSense supports English and Tamil for Text-to-Speech (TTS) and Speech-to-Text (STT).'),
      ],
    );
  }

  Widget _faqItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            answer,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _guidelinesSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Usage Guidelines:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          '1. **Voice Commands**: Use voice commands to navigate between modes and habitats. Commands should be clear and concise.',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          '2. **General Mode**: Activate this mode to start using the camera for object detection. Ensure the camera is unobstructed for accurate detection.',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          '3. **Habitats Mode**: Use this mode to access predefined locations or habitats. Ensure your settings are properly configured for optimal usage.',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          '4. **Settings**: Adjust language preferences and other settings from the settings page to customize your experience.',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _feedbackSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Feedback:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'We value your feedback to improve OmniSense. Please reach out to us with your comments, suggestions, or issues via email at feedback@omnisense.com.',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Implement email client or feedback form
            print('Feedback button pressed');
          },
          child: const Text('Submit Feedback'),
        ),
      ],
    );
  }
}
