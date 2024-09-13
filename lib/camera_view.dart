import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    // Get available cameras
    cameras = await availableCameras();

    // Initialize the first camera (usually rear camera)
    _controller = CameraController(cameras![0], ResolutionPreset.high);

    // Initialize the camera controller
    await _controller?.initialize();

    // Rebuild UI after camera is initialized
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Display camera preview or a loading indicator while the camera is initializing
    if (!_controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return CameraPreview(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
