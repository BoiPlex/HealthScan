import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class HappyPage extends StatefulWidget {
  const HappyPage({Key? key}) : super(key: key);

  @override
  _HappyPageState createState() => _HappyPageState();
}

class _HappyPageState extends State
{
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

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
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Capture Emotion'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final image = await _controller.takePicture();

                String detectedEmotion = detectEmotion(image);

                if (detectedEmotion == "happy") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You seem happy!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You seem $detectedEmotion.'),
                    ),
                  );
                }
              },
              child: Text('Capture Emotion'),
            ),
          ],
        ),
      ),
    );
  }

  String detectEmotion(XFile image) {
    List<String> emotions = ['happy', 'sad']; 
    return emotions[DateTime.now().millisecondsSinceEpoch % 2];
  }
}
