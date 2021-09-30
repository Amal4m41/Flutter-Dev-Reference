import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Dicee",
          ),
          centerTitle: true,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatelessWidget {
  var leftDiceNumber = 3;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            //Creates a widget that expands a child of a Row, Column, or Flex so that the child fills the available space along the flex widget's main axis
            child: TextButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: () {
                //anonymous function
                print('Pressed left button');
              },
            ), //shortcut method.
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                print("Pressed right button");
              },
              child: Image.asset('images/dice4.png'),
            ),
          ),
        ],
      ),
    );
  }
}
