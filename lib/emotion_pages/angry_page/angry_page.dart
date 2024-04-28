/*
import 'package:flutter/material.dart';
import 'dart:async';

class AngryPage extends StatelessWidget {
  const AngryPage({
    super.key
  @override
  _ButtonState createState() => _AngryPageState();
  });

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Try this breathing exercise'),
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              '$_counter seconds.',
              style: TextStyle(
                fontSize: 48,
              ), // TextStyle
            ), // Text
            RaisedButton(
              onPressed: () =>_startTimer(),
              child: Text("Start Exercise"),
            ), //RaisedButton
          ], // Widget
        ), // Column
      ), // Center
    ); // Scaffold
  }
}


class _AngryPageState extends State<AngryPage> { 
  int _counter = 6;
  Timer _timer;
  String state = "";

  void _startTimer() {
    state = "Breath in for : ";
    _counter = 6;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(_counter>0) {
        _counter--;
      } else {
        timer.cancel();
        _counter = 5;
        state = "Hold your breath for: ";
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          if(_counter>0) {
            _counter--;
          } else {
            timer.cancel();
            _counter = 4;
            state = "Exhale for: ";
            _timer = Timer.periodic(Duration(seconds: 1), (timer) {
              if(_counter>0) {
                _counter--;
              } else {
                timer.cancel();
              }
            });
          }
        });
        _timer.cancel();
      }
    });

  }
}
*/


