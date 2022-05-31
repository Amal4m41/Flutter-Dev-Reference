import 'package:flutter/material.dart';

class SomeScreen extends StatefulWidget {
  final int num;
  SomeScreen(this.num, {Key? key}) : super(key: key) {
    print('SomeScreen constructor $num');
  }

  @override
  State<SomeScreen> createState() => _SomeScreenState();
}

class _SomeScreenState extends State<SomeScreen> {
  int count = 0;

  _SomeScreenState() {
    print('SomeScreen STATE');
  }

  @override
  void initState() {
    super.initState();
    print('INIT STATE SomeScreen ${widget.num}');
  }

  @override
  void dispose() {
    print('DISPOSE SomeScreen ${widget.num}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD SomeScreen ${widget.num}");
    return Scaffold(
      body: Center(child: Text('SomeScreen SCREEN $count')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          count++;
        }),
      ),
    );
  }
}
