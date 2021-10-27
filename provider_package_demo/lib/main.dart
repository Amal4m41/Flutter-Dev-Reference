import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String data = "My secret data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(data),
        ),
        body: Level1(data),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  final String data;
  Level1(String this.data);

  @override
  Widget build(BuildContext context) {
    return Level2(data);
  }
}

class Level2 extends StatelessWidget {
  final String data;
  Level2(String this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Level3(data),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  final String data;
  Level3(String this.data);

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
