import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // const a = BlueSquare(size: 5);
  // const b = BlueSquare(size: 5);
  // print(a.hashCode);
  // print(b.hashCode);
  // print(a == b);

  // runApp(MyApp());
}

class AStateLesssWidget extends StatelessWidget {
  // final void Function(int a) callback;
  // final int a;
  const AStateLesssWidget();

  // void myDummyFunction() {
  //   print("IN ASTATLELESSWIDGET ${this.hashCode}");
  // }

  @override
  Widget build(BuildContext context) {
    print('AStateLesssWidget BUILD');
    return Container(
        // child: TextButton(
        //   onPressed: () {
        //     // myDummyFunction();
        //   },
        //   child: Text("BUTTON"),
        // ),
        );
  }
}

class BlueSquare extends StatelessWidget {
  final double size;

  const BlueSquare({Key? key, required this.size}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      color: Colors.blue,
    );
  }
}
