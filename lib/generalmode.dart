import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
<<<<<<< HEAD
=======
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:typed_data'; // For handling image data
>>>>>>> origin/master

class GeneralMode extends StatefulWidget {
  const GeneralMode({super.key});

  @override
  _GeneralModeState createState() => _GeneralModeState();
}

class _GeneralModeState extends State<GeneralMode> {
  CameraController? _cameraController;
  final FlutterTts _flutterTts = FlutterTts();
<<<<<<< HEAD
=======
  late Interpreter _interpreter;
>>>>>>> origin/master

  @override
  void initState() {
    super.initState();
    _initializeCamera();
<<<<<<< HEAD
=======
    _loadModel(); // Load the TensorFlow Lite model
  }

  Future<void> _loadModel() async {
    try {
      _interpreter =
          await Interpreter.fromAsset('assets/models/MobileNet_V2.tflite');
      print('Model loaded successfully.');
    } catch (e) {
      print('Error loading model: $e');
    }
>>>>>>> origin/master
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(firstCamera, ResolutionPreset.high);

    try {
      await _cameraController?.initialize();
      if (!mounted) return;
      setState(() {});
<<<<<<< HEAD
      _cameraController?.startImageStream((image) {
        // Your image processing logic here
=======

      _cameraController?.startImageStream((image) {
        _runModelOnFrame(image); // Process the image and run inference
>>>>>>> origin/master
      });
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

<<<<<<< HEAD
  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
=======
  void _runModelOnFrame(CameraImage image) async {
    // Convert image to the required format
    var input = _convertCameraImageToTensor(image);
    var inputShape = _interpreter.getInputTensor(0).shape;

    var output =
        List.filled(inputShape.reduce((a, b) => a * b), 0).reshape(inputShape);
    _interpreter.run(input, output);

    // Process the output (e.g., identify detected objects)
    _processOutput(output);
  }

  Uint8List _convertCameraImageToTensor(CameraImage image) {
    // Convert CameraImage to a format compatible with TensorFlow Lite model
    // You need to implement this method based on your model requirements
    // For instance, you might need to resize the image and normalize pixel values
    // This is a placeholder implementation
    return Uint8List(0); // Replace with actual conversion logic
  }

  void _processOutput(List<dynamic> output) {
    // Interpret model output
    // This example assumes a classification model with labels
    // You'll need to adjust based on your model's output format

    // Example of interpreting output (change according to your model)
    String detectedObject =
        "unknown"; // Replace with actual object detection logic
    if (output.isNotEmpty) {
      detectedObject =
          "detected object label"; // Replace with actual label processing
    }

    // Provide audio feedback
    _speak("Detected: $detectedObject");
>>>>>>> origin/master
  }

  Future<void> _speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  @override
<<<<<<< HEAD
=======
  void dispose() {
    _cameraController?.dispose();
    _interpreter.close(); // Close the interpreter
    super.dispose();
  }

  @override
>>>>>>> origin/master
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Mode'),
      ),
      body: Center(
        child: _cameraController == null
            ? const CircularProgressIndicator()
            : CameraPreview(_cameraController!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _speak("General Mode activated");
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
