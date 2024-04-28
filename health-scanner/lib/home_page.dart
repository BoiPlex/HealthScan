import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:dummy/scan_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(
          'Mood Monitor',
          style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0, // Remove elevation
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add your settings functionality here
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add horizontal padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 0),
              Padding(
                padding: EdgeInsets.all(50), // Adjust padding as needed
                child: Image.asset(
                  'images/mood_monitor_logo.png', // Replace with your image URL
                  width: 210, // Adjust width as needed
                  height: 210, // Adjust height as needed
                ),
              ),
              //Image.asset("", width: 150.0, height: 150.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add horizontal padding
                child: Text(
                  'How are we feeling today? Take a photo of yourself.',
                  style: TextStyle(fontSize: 21, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 0, height: 0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanPage()));
                },
                icon: Icon(Icons.camera_alt),
                label: Text('Start', style: TextStyle(fontSize: 20)), // Increase font size for the button text
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
                  textStyle: TextStyle(fontSize: 20),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Increased padding for the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
