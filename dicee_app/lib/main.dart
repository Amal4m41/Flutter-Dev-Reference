import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  print("MAIN function");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("My APP");
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

// class DicePage extends StatelessWidget {
//   var leftDiceNumber = 3;
//   DicePage() {
//     print("Dice page");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("build function");
//
//     return Center(
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             //Creates a widget that expands a child of a Row, Column, or Flex so that the child fills the available space along the flex widget's main axis
//             child: TextButton(
//               child: Image.asset('images/dice$leftDiceNumber.png'),
//               onPressed: () {
//                 //anonymous function
//                 leftDiceNumber = 5;
//                 print('Pressed left button $leftDiceNumber');
//               },
//             ), //shortcut method.
//           ),
//           Expanded(
//             flex: 1,
//             child: TextButton(
//               onPressed: () {
//                 print("Pressed right button");
//               },
//               child: Image.asset('images/dice6.png'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  _DicePageState() {
    print("dice page constructor");
  }
  int leftDiceNumber = 1; //defining the state variables here.
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    print("build function");
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
                getRandomNumber();
                print('Pressed left button $leftDiceNumber');
              },
            ), //shortcut method.
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                getRandomNumber();
                print("Pressed right button value $rightDiceNumber");
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }

  void getRandomNumber() {
    setState(() {
      //after setState is called, and onPressed function is finished it'll rebuild the Widget w.r.t the latest state
      //i.e. the 'build' function will be called again.
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
