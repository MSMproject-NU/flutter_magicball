import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() {
  return runApp(
    MaterialApp(
      title: "Magic Ball",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue,
        ),
        body: AMA(),
      ),
    ),
  );
}

class AMA extends StatefulWidget {
  @override
  _AMAState createState() => _AMAState();
}

class _AMAState extends State<AMA> {

  void playAudio(){
    AudioCache player = new AudioCache();
    String AudioPath = "audio/faded.mp3";
    player.play(AudioPath);
    player.clear(AudioPath);
  }


  int number = 1;

  void Answer() {
    setState(() {
      number = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: (){

                playAudio();

                Answer();

              },
              child: Image.asset('assets/images/ball$number.png'),
            ),
          ),
        ],
      ),
    );
  }
}