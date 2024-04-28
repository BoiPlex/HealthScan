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
          title: Text('Mood Monitor'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(50.0), // Adjust padding as needed
                child: Image.asset(
                  'assets/images/mood_monitor_logo.png', // Replace with your image URL
                  width: 200, // Adjust width as needed
                  height: 200, // Adjust height as needed
                ),
              ),
              //Image.asset("", width: 150.0, height: 150.0),
              Text(
                'How are we feeling today? Take a photo of yourself.',
                style: TextStyle(fontSize: 24, color:Colors.white) ,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                // onPressed: () async {
                //   // add in the function for button pressed to go to scan page
                //   await availableCameras().then((value) => Navigator.of(context)
                //       .push(MaterialPageRoute(
                //           builder: (context) => ScanPage(cameras: value))));
                // },
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ScanPage()));
                },
                child: Text('Start'),
              ),
            ],
          ),
        ));
  }
}
