import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  DemoApp({Key? key}) : super(key: key);

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  int value = 0;

  // void simpleCallback(int val) {
  //   print(value);
  //   print(val);
  //   setState(() {});
  //   myDummyFunction();
  // }

  void myDummyFunction() {
    print("IN DEMO APP");
  }

  @override
  Widget build(BuildContext context) {
    print("DEMO APP BUILD");
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red.shade100,
          child: Column(
            children: [
              Text(value.toString()),
              MaterialButton(
                onPressed: () {
                  value++;
                },
                child: Text("ADD"),
              ),
              // AStateLesssWidget(simpleCallback),
              AStateLesssWidget((int val) {
                print(value);
                print(val);
                setState(() {});
                myDummyFunction();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class AStateLesssWidget extends StatelessWidget {
  void Function(int a) callback;
  AStateLesssWidget(this.callback);

  void myDummyFunction() {
    print("IN ASTATLELESSWIDGET");
  }

  @override
  Widget build(BuildContext context) {
    print('AStateLesssWidget BUILD');
    return Container(
      child: TextButton(
        onPressed: () {
          callback(20);
        },
        child: Text("BUTTON"),
      ),
    );
  }
}
