import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/messi_profile_image.png'),
              ),
              const Text(
                "Lionel Messi",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico_custom_font',
                ),
              ),
              const Text(
                "PROFESSIONAL FOOTBALLER",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceSansPro_custom_font',
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 10,
                width: 150,
                child: Divider(
                  //divider adds a 1 pixel horizontal rule.
                  color: Colors.teal[100],
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+44 123 456 789",
                    style: TextStyle(
                        color: Colors.teal[800],
                        fontSize: 18,
                        fontFamily: 'SourceSansPro_custom_font',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "messi10@gmail.com",
                    style: TextStyle(
                      color: Colors.teal[800],
                      fontSize: 18,
                      fontFamily: 'SourceSansPro_custom_font',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blue,
//         body: SafeArea(
//           //Creates a widget that avoids operating system interfaces(Bezels, Notch etc).
//           child: Container(
//             height: 200,
//             width: 500,
//             padding: EdgeInsets.fromLTRB(10, 20, 30, 50),
//             margin: EdgeInsets.symmetric(vertical: 50, horizontal: 100),
//             child: Text("Hello World"),
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

// Row(
// children: [
// Icon(
// Icons.email,
// color: Colors.teal,
// ),
// SizedBox(
// width: 15,
// ),
// Text(
// "messi10@gmail.com",
// style: TextStyle(
// color: Colors.teal[800],
// fontSize: 18,
// fontFamily: 'SourceSansPro_custom_font',
// fontWeight: FontWeight.bold,
// ),
// )
// ],
// )

class MyAppRowsAndColumn extends StatelessWidget {
  const MyAppRowsAndColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          //Creates a widget that avoids operating system interfaces(Bezels, Notch etc).
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Text("Container 1"),
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 20), //or use sized box
              ),
              // SizedBox(
              //   height: 20, //just to add manual spacing
              // ),
              Container(
                height: 200,
                width: 200,
                color: Colors.redAccent,
                child: Text("Container 2"),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.lightGreenAccent,
                child: Text("Container 3"),
              ),
              // Container(
              //   //creating an invisible container of width as that of the screen so that,
              //   //all the column can be aligned to the end w.r.t the cross axis, as the alignment
              //   //is done w.r.t the other elements/children.
              //   width: double.infinity, //as wide as the screen
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class ChallengeSolution extends StatelessWidget {
  const ChallengeSolution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: double.infinity,
                  width: 100,
                  color: Colors.red,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                    )
                  ],
                ),
                Container(
                  height: double.infinity,
                  width: 100,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
