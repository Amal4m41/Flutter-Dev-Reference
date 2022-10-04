import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[700],
        appBar: AppBar(
          backgroundColor: Colors.amberAccent[100],
          title: const Text("I Am Poor"),
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/cyborg-pickaxe.png'),
          ),
        ),
      ),
    ),
  );
}
