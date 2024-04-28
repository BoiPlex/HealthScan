import 'package:flutter/material.dart';
import 'dart:math';

class SurprisePage extends StatelessWidget {
  SurprisePage({Key? key}) : super(key: key);

  final List<String> positiveAffirmations = [
    "You are capable of amazing things!",
    "You are loved and appreciated!",
    "You bring joy to those around you!",
    "You have the power to overcome any challenge!",
    "You are making a positive impact in the world!",
  ];

  @override
  Widget build(BuildContext context) {
    // Generate a random index to select a random affirmation
    int randomIndex = Random().nextInt(positiveAffirmations.length);

    return Scaffold(
      appBar: AppBar(
        title: Text('SURPRISE'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            positiveAffirmations[randomIndex],
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
