import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Screen 1"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            //Push the screen2 on top of the stack.
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return Screen2();
            // }));
            Navigator.pushNamed(context, '/second');
          },
          child: Text("Go to Screen 2"),
        ),
      ),
    );
  }
}
