import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<Color> colorsList = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.pinkAccent,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(children: [
            for (int i = 1; i <= 7; i++)
              Expanded(
                child: SoundButton(i, colorsList[i - 1]),
              ), //expand w.r.t column main axis
          ]),
        ),
      ),
    );
  }
}

class SoundButton extends StatelessWidget {
  int noteNumber = 1;
  Color buttonColor = Colors.red;
  static AudioCache player = AudioCache();

  SoundButton(int noteNumber, Color buttonColor) {
    this.noteNumber = noteNumber;
    this.buttonColor = buttonColor;
  }

  void playAudio(int noteNumberValue) {
    player.play('note$noteNumberValue.wav');
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        playAudio(noteNumber);
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
        ),
        color: buttonColor,
      ),
    );
  }
}
