import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person with ChangeNotifier {
  Person({required this.name, required this.age});

  String name;
  int age;

  void increaseAge() {
    this.age++;
    this.name = 'new name $age';
    notifyListeners();
  }
}

class Counter with ChangeNotifier {
  int _count = 0;

  Counter() {
    print('constructor of counter');
  }

  int get count => _count;

  void increaseCount() {
    _count++;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Person(name: "Yohan", age: 25),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Material App build');
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('main screen');
    MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: PersonsNameLabel(),
          ),
          ChangeNotifierProvider(
              create: (BuildContext context) => Counter(),
              builder: (context, child) {
                print('build counter text');
                return Expanded(
                  child: Column(
                    children: [
                      Text('Count: ${context.watch<Counter>().count}'),
                      ElevatedButton(
                          onPressed: () {
                            context.read<Counter>().increaseCount();
                          },
                          child: Text('Increment counter'))
                    ],
                  ),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<Person>(context, listen: false).increaseAge(),
      ),
    );
  }
}

class PersonsNameLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build name label');
    return Provider<String>.value(
      // value: Provider.of<Person>(context,listen: true).name,
      value: context.watch<Person>().name,
      builder: (BuildContext context, Widget? child) {
        print('build text');
        return Text(context.watch<String>());
      },
    );
  }
}
