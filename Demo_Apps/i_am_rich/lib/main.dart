import 'package:flutter/material.dart';

//The main function is the starting point for all our Flutter apps.
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("I Am Rich"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
          //use alt+enter to add center automatically
          child: Image(
            // image: NetworkImage('https://121quotes.com/wp-content/uploads/2019/09/messi-image-2016.jpg'),
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
