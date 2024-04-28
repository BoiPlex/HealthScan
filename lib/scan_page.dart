import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'main.dart';

late List<CameraDescription> _cameras = <CameraDescription>[];

class ScanPage extends StatelessWidget {
  ScanPage({
    super.key,
    required this.cameras,
    emotion,
  });
  // late List<CameraDescription>? cameras = [];
  final List<CameraDescription> cameras;
  // late CameraController controller = CameraController(cameras![0], ResolutionPreset.max);

  @override
  Widget build(BuildContext context) {
    _cameras = cameras;
    print(_cameras);

    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Scan Emotion'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Camera here
              // CameraPreview(controller),

              // Take photo button
              ElevatedButton(
                onPressed: () {},
                child: Text('Capture Emotion'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ()))
                },
                child: Text('Confirm Emotion Placeholder'),
              ),
            ],
          ),
        ));
  }
}

/*
 Future<void> _showMyDialog() async {
    var context;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Current Feeling'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Is this feeling correct?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/