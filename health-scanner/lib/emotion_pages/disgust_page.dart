import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class DisgustPage extends StatelessWidget {
  DisgustPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Emotion Page'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DisgustLinksPage())
                  );
                },
                child: Text('Capture Emotion'),
              ),
            ],
          ),
        ));
  }
}

class DisgustLinksPage extends StatelessWidget {
  const DisgustLinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disgust Links'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Link 1'),
            onTap: () {
              // Link 1
              _launchURL('https://example.com/link1');
            },
          ),
          ListTile(
            title: Text('Link 2'),
            onTap: () {
              // Link 2
              _launchURL('https://example.com/link2');
            },
          ),
        ],
      ),
    );
  }

  // Function to launch URL
  void _launchURL(String url) {
    // Add logic to launch the URL
    print('Launching URL: $url');
  }
}