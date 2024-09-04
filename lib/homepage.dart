import 'package:flutter/material.dart';
import 'camera_service.dart';
import 'mic_service.dart';

class OmniSenseHomePage extends StatefulWidget {
  @override
  _OmniSenseHomePageState createState() => _OmniSenseHomePageState();
}

class _OmniSenseHomePageState extends State<OmniSenseHomePage> {
  String detectedObject = "No object detected yet";

  void _detectObject() {
    setState(() {
      detectedObject = CameraService.detectObject(); // Call camera service
    });
  }

  void _listenToMic() {
    MicService.listenToMic(); // Call microphone service
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OmniSense'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              detectedObject,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _detectObject,
              child: Text('Start Camera'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _listenToMic,
              child: Text('Activate Microphone'),
            ),
          ],
        ),
      ),
    );
  }
}
