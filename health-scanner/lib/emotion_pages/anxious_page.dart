import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class AnxiousPage extends StatelessWidget {
  AnxiousPage({super.key});

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
                  MaterialPageRoute(builder: (context) => AnxiousLinksPage())
                  );
                },
                child: Text('Capture Emotion'),
              ),
            ],
          ),
        ));
  }
}

class AnxiousLinksPage extends StatelessWidget {
  const AnxiousLinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anxious Links'),
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