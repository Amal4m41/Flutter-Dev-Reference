import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Checking the life of a provider instance.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Building First screen');
    return ChangeNotifierProvider(
      create: (_) => AppData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('sample screen'),
        ),
        body: Builder(
          builder: (context) {
            print('Building Consumer');
            AppData appData = Provider.of<AppData>(context);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('First Screen ${appData.counter}'),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          print("BUILD PAGE ROUTE");
                          return ChangeNotifierProvider.value(value: appData, child: const ScreenTwo());
                        }));
                      },
                      child: const TextWidget()),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                context.read<AppData>().updateCounter();
              },
            );
          },
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD TEXT WIDGET");
    return Text('Text widget: ${context.watch<AppData>().counter}');
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD SCREEN TWO');
    return Scaffold(
      body: Center(
        child: Builder(builder: (context) {
          print("BUILDER SECOND SCREEN");
          return Text('Second screen : ${context.watch<AppData>().counter}');
        }),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              context.read<AppData>().updateCounter();
            },
          );
        },
      ),
    );
  }
}

class AppData with ChangeNotifier {
  late int _counter;

  AppData() {
    print('APPDATA constructor');
    _counter = 0;
  }

  void updateCounter() {
    _counter++;
    print("UPDATING TO: $_counter");
    // await Future.delayed(Duration(seconds: 3));
    notifyListeners();
  }

  void justForFun() {
    notifyListeners();
  }

  @override
  void dispose() {
    print('DISPOSE');
  }

  int get counter => _counter;
}
