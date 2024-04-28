import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DisgustPage extends StatelessWidget {
  DisgustPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Don\t feel disgusted.. Have some resoucres...'),
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
                      MaterialPageRoute(
                          builder: (context) => DisgustLinksPage()));
                },
                child: Text('Get Resource Links'),
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
            title: Text('Supprot Numbers'),
            onTap: () {
              // Link 1
              launchUrl(
                  Uri.parse('https://mentalhealth.ucdavis.edu/i-need-help'));
            },
          ),
          ListTile(
            title: Text('Online Couseling'),
            onTap: () {
              // Link 2
              launchUrl(Uri.parse('https://shcs.ucdavis.edu/online-visits'));
            },
          ),
          ListTile(
            title: Text('Mental Health Basics'),
            onTap: () {
              // Link 3
              launchUrl(Uri.parse(
                  'https://mentalhealth.ucdavis.edu/resources/basics'));
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
