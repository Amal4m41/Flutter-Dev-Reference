import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int num;
  HomeScreen(this.num, {Key? key}) : super(key: key) {
    print('Home screen constructor $num');
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  _HomeScreenState() {
    print('HOME SCREEN STATE');
  }

  @override
  void initState() {
    super.initState();
    print('INIT STATE HOMESCREEN ${widget.num}');
  }

  @override
  void dispose() {
    print('DISPOSE HOMESCREEN ${widget.num}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD HOME SCREEN ${widget.num}");
    return Scaffold(
      body: Center(child: Text('HOME SCREEN $count')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          count++;
        }),
      ),
    );
  }
}
