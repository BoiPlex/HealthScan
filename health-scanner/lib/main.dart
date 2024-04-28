import 'package:flutter/material.dart';
import 'package:dummy/home_page.dart';
import 'package:camera/camera.dart';

// late List<CameraDescription> cameras;

Future<void> main() async {
  // print(_cameras);

  // await CameraManager.instance.init();

  // WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  // const firstCamera = cameras[0];

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

/*
class CameraManager {
  // Declare your camera list here
  List<CameraDescription> _cameras = <CameraDescription>[];

  // Constructor
  CameraManager._privateConstructor() {}

  // initialise instance
  static final CameraManager instance = CameraManager._privateConstructor();

  // Add a getter to access camera list
  List<CameraDescription> get cameras => _cameras;

  // Init method
  init() async {
    try {
      _cameras = await availableCameras();
    } on CameraException catch (e) {
      // _logError(e.code, e.description);
    }
  }

  // other needed methods to manage camera
}

*/