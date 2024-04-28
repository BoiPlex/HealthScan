import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/rendering.dart';
import 'main.dart';

import 'package:dummy/emotion_pages/fear_page.dart';

late List<CameraDescription> _cameras = <CameraDescription>[];

class ScanPage extends StatefulWidget {
  ScanPage({
    super.key,
    required this.cameras,
    emotion,
  });
  final List<CameraDescription> cameras;

  @override
  ScanPageState createState() => ScanPageState();
}

class ScanPageState extends State<ScanPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _cameras = widget.cameras;
    _controller = CameraController(_cameras[0], ResolutionPreset.max);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Scan Emotion'),
        elevation: 0,
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(child: CameraPreview(_controller));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            _controller.pausePreview();
            if (!context.mounted) return;
            // Process image
            print(image);
          } catch (e) {
            print(e);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}

/*
// Camera here
CameraPreview(_controller),

// Take photo button
ElevatedButton(
  onPressed: () async {
    try {
      final image = await _controller.takePicture();
      print(image);
    } catch (e) {
      print(e);
    }
  },
  child: Text('Take Pic'),
),
ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => FearPage()));
  },
  child: Text('Confirm Emotion Placeholder'),
),





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