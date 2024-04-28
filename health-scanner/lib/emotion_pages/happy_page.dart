import 'package:flutter/material.dart';

class HappyPage extends StatelessWidget {
  const HappyPage({Key? key}) : super(key: key);

  @override
  _HappyPageState createState() => _HappyPageState();
}

class _HappyPageState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 79, 170, 235),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('No work needed! You\'re happy!'),
      ),
      body: Center(
          child: Text(
        "Take a nice walk",
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
