import 'dart:async';

import 'package:flutter/material.dart';

class AngryPage extends StatefulWidget {
  @override
  _AngryPageState createState() => _AngryPageState();
}

class _AngryPageState extends State<AngryPage> {
  int time = 4;
  String pre_string = "Breath in for : ";
  void _startCountDown1() {
    pre_string = "Breath in for : ";
    setState((){
      time = 4;
    });
    Timer.periodic(Duration(seconds: 1),(timer){
      setState((){
        if(time > 0) {
            time--;
        } else {
          timer.cancel();
          pre_string = "Hold your breath for: ";
          time = 5;
          Timer.periodic(Duration(seconds: 1),(timer2){
            setState((){
              if(time > 0) {
                time--;
              } else {
                timer2.cancel();
                pre_string = "Exhale for: ";
                time = 6;
                Timer.periodic(Duration(seconds: 1),(timer3){
                  setState(() {
                    if(time > 0) {
                      time--;
                    } else {
                      timer3.cancel();
                    }
                  });
                });
              }
            });
          });
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Try this exercise to feel better. Repeat as necessary.'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(pre_string + time.toString() + " seconds", style: TextStyle(fontSize: 50),),
            MaterialButton(
              onPressed: _startCountDown1,
              child: Text(
                'START EXERCISE',
                style: TextStyle(color: Colors.white)
              ),
              color: Colors.green
            ),
          ],
        )
      )
    );
  }
}