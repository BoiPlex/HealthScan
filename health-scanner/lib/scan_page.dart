import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http_parser/http_parser.dart';

import 'package:dummy/emotion_pages/happy_page.dart';
import 'package:dummy/emotion_pages/disgust_page.dart';
import 'package:dummy/emotion_pages/fear_page.dart';
import 'package:dummy/emotion_pages/neutral_page.dart';
import 'package:dummy/emotion_pages/sad_page.dart';
import 'package:dummy/emotion_pages/breather_page.dart';

const emotionURL = "http://127.0.0.1:7000/emotion";

// final dio = Dio();
// late List<CameraDescription> _cameras = <CameraDescription>[];

class ScanPage extends StatefulWidget {
  ScanPage({
    super.key,
    // required this.cameras,
    // emotion,
  });
  // final List<CameraDescription> cameras;

  @override
  ScanPageState createState() => ScanPageState();
}

class ScanPageState extends State<ScanPage> {
  // late CameraController _controller;
  // late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // _cameras = widget.cameras;
    // _controller =
    //     CameraController(_cameras[0], ResolutionPreset.max, enableAudio: false);
    // _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Icon(
              // ignore: prefer_const_constructors
              Icons.camera,
              size: 160,
              color: Colors.black,
            ),
            SizedBox(height: 40),
            Text(
              'Get Ready! We\'ll take a photo right away!',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                try {
                  final response = await http.get(Uri.parse(emotionURL));

                  if (response.statusCode == 200) {
                    final features =
                        jsonDecode(response.body) as Map<String, dynamic>;
                    var dominantEmotion = features["dominant_emotion"];
                    var dominantEmotionPerecnt = features["emotion"]
                            [dominantEmotion]
                        .toString()
                        .substring(0, 5);
                    // print(features);
                    showAlertDialog(
                        context,
                        "We detected that you're $dominantEmotionPerecnt% $dominantEmotion!",
                        dominantEmotion);
                  } else {
                    print("ERROR");
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Capture Emotion'),
            ),
          ],
        ),
      ),
      /*
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
            // await _initializeControllerFuture;
            // final imageXFile = await _controller.takePicture();
            // _controller.pausePreview();
            // if (!context.mounted) return;
            // // Process image
            // final imageFile = File(imageXFile.path);
            // print(0);

            try {
              final response = await http.get(Uri.parse(emotionURL));

              //   final request =
              //       http.MultipartRequest("POST", Uri.parse(emotionURL));
              //   print(0);
              //   // final headers = {"Content-type": "multipart/form-data"};
              //   request.files.add(
              //     await http.MultipartFile.fromPath(
              //       "file",
              //       imageXFile.path,
              //       contentType: MediaType('image', 'png'),
              //     ),
              //   );
              //   print(0);
              //   // request.headers.addAll(headers);
              //   print(0);
              //   final response =
              //       await http.Response.fromStream(await request.send());
              //   print(0);
              //   // final resJson = jsonDecode(res.body);
              //   print(response.body);

              // final request = http.post(Uri())

              // print(resJson);
              // print(1);
              // final response = await http.get(Uri.parse(emotionURL));

              // final response = await dio
              //     .post(emotionURL, data: {'imgPath': 12, 'name': 'dio'});
              // final queryParams = {
              //   "imagePath": imageFile.path,
              // };
              // final uri = Uri.https(emotionURL, "/emotion", queryParams);

              // final uri = Uri.parse("$emotionURL").replace(queryParameters: {
              //   "imgName": imageFile.path.split("/").last,
              //   "imgBytes": imageFile.readAsBytes(),
              // });
              // final response = await http.get(uri);
              // print(response.body);

              // print(2);
              // print(response);
              // print(response.statusCode);
              // print(response.body);

              if (response.statusCode == 200) {
                final features = response.body;
                print(features);
                // var dominantEmotion = features["dominant_emotion"];
                print('success');
                // if (dominantEmotion == "neutral") {
                //   print("NEUTRAL");
                // } else {
                //   print("OTHER");
                // }
              } else {
                //BotToast is a package for toasts available on pub.dev
                print("ERROR");
              }
            } catch (e) {
              print(e);
            }
          } catch (e) {
            print(e);
          }
        },
        backgroundColor: Colors.white,
        tooltip: "Analyze My Emotion",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      */
    );
  }
}

Future<bool> showAlertDialog(
    BuildContext context, String message, String emotion) async {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    child: Text("Cancel"),
    onPressed: () {
      // returnValue = false;
      Navigator.of(context).pop(false);
    },
  );
  Widget continueButton = ElevatedButton(
    child: Text("Continue"),
    onPressed: () {
      // returnValue = true;
      Navigator.of(context).pop(true);
      // print(emotion);
      // emotion = "disgust";
      if (emotion == "neutral") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NeutralPage()));
      } else if (emotion == "happy") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HappyPage()));
      } else if (emotion == "sad") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SadPage()));
      } else if (emotion == "angry") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BreatherPage()));
      } else if (emotion == "fear") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FearPage()));
      } else if (emotion == "surprise") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BreatherPage()));
      } else if (emotion == "disgust") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DisgustPage()));
      } else {
        print("Other");
      }
    },
  ); // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Are you feeling $emotion?"),
    content: Text(message),
    actions: [
      cancelButton,
      continueButton,
    ],
  ); // show the dialog
  final result = await showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  return result ?? false;
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