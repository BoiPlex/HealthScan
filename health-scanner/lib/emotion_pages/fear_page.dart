import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

bool timeOn = false;

class FearPage extends StatefulWidget {
  @override
  _FearPageState createState() => _FearPageState();
}

class _FearPageState extends State<FearPage> {
  static AudioPlayer player = new AudioPlayer();
  AssetSource alarmAudioPath = new AssetSource("sounds/ocean_noises.mp3");
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/ocean.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.fitHeight,
              ),
            ),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                iconSize: 50,
                onPressed: () async{
                  if(isPlaying) {
                    await player.pause();
                  } else {
                    await player.play(alarmAudioPath);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}