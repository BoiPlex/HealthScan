import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:math';

class SadPage extends StatefulWidget {
  SadPage({Key? key}) : super(key: key);

  @override
  _SadPageState createState() => _SadPageState();
}

class _SadPageState extends State<SadPage> {
  // List of jokes
  final List<Map<String, String>> jokes = [
    {
      'question': "Why don't scientists trust atoms?",
      'answer': "Because they make up everything!"
    },
    {
      'question': "I told my wife she was drawing her eyebrows too high. She looked surprised.",
      'answer': ""
    },
    {
      'question': "Why don't skeletons fight each other?",
      'answer': "They don't have the guts."
    },
    {
      'question': "What do you call fake spaghetti?",
      'answer': "An impasta!"
    },
    {
      'question': "Why did the tomato turn red?",
      'answer': "Because it saw the salad dressing!"
    },
    // Add more jokes as needed
  ];

  // Random number generator
  final Random random = Random();

  Map<String, String> currentJoke = {};

  @override
  void initState() {
    super.initState();
    displayRandomJoke();
  }

  void displayRandomJoke() {
    // Generate a random joke
    currentJoke = jokes[random.nextInt(jokes.length)];

    // Update the UI to show the question
    setState(() {});

    // Delay the display of the answer
    Future.delayed(Duration(seconds: 3), () {
      // Update the UI to show the answer
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Things will get better.'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Feeling sad? Here\'s a joke to cheer you up:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                currentJoke['question'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            if (currentJoke['answer'] != null)
              Text(
                currentJoke['answer']!,
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: displayRandomJoke,
        child: Icon(Icons.refresh),
      ),
    );
  }
}