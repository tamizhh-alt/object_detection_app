import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';

class GeneralMode extends StatefulWidget {
  @override
  _GeneralModeState createState() => _GeneralModeState();
}

class _GeneralModeState extends State<GeneralMode> {
  CameraController? _cameraController;
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(firstCamera, ResolutionPreset.high);

    try {
      await _cameraController?.initialize();
      if (!mounted) return;
      setState(() {});
      _cameraController?.startImageStream((image) {
        // Your image processing logic here
      });
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Mode'),
      ),
      body: Center(
        child: _cameraController == null
            ? CircularProgressIndicator()
            : CameraPreview(_cameraController!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _speak("General Mode activated");
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
