import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  const Screen0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Screen 0"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
              child: Text("Go to Screen 1"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text("Go to Screen 2"),
            ),
          ],
        ),
      ),
    );
  }
}
