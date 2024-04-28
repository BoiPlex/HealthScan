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
                onPressed: () {},
                child: Text('Capture Emotion'),
              ),
            ],
          ),
        ));
  }
}
