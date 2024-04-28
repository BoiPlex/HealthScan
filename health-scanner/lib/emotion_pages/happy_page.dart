import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:math';

class HappyPage extends StatelessWidget {
  HappyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('That\'s great! You\'re happy!'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Take a nice walk outdoors",
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
