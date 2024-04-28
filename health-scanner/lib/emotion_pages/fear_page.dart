import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class FearPage extends StatelessWidget {
  FearPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
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
                  MaterialPageRoute(builder: (context) => FearLinksPage())
                  );
                },
                child: Text('Capture Emotion'),
              ),
            ],
          ),
        ));
  }
}

class FearLinksPage extends StatelessWidget {
  const FearLinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fear Links'),
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