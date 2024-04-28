import 'package:flutter/material.dart';
import 'package:dummy/scan_page.dart';
import 'package:camera/camera.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Health Scanner'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*Icon(
              // ignore: prefer_const_constructors
                Icons.favorite,
                size: 100,
                color: Colors.red,
              ),
              SizedBox(height: 20),*/
              Image.asset("images/mood_monitor_logo.png", width: 150.0, height: 150.0),
              Text(
                'Stay Healthy!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  // add in the function for button pressed to go to scan page
                  await availableCameras().then((value) => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ScanPage(cameras: value))
                  ));
                },
                child: Text('Starting'),
              ),
            ],
          ),
        ));
  }
}
