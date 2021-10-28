import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Different method/way of doing the same thing as of main2.dart

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
    print('Building MainPage');
    return ChangeNotifierProvider(
      create: (_) => AppData(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title:
                TextWidget(), //watch is same as Provider.of... with listen = true.
          ),
          body: Screen2(),
        );
      },
    );
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building textwidget");
    return Text(context.watch<AppData>().name);
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Building Screen2');
    return Container(
      child: Screen3(),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Building Screen3');
    return Container(
      child: Screen4(),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building Screen4');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(), //A listener.
          ElevatedButton(
            onPressed: () {
              //context.read is same as Provider.of.. listen is set to 'false'.
              context.read<AppData>().changeData("Ronaldo");
            },
            child: Text("Change data"),
          ),
          Screen5(),
        ],
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building Screen5');
    return Center(
      child: Text("SIMPLE"),
    );
  }
}

class AppData with ChangeNotifier {
  String _name = "Neymar";

  void changeData(String value) {
    _name = value;
    notifyListeners();
  }

  String get name => _name;
}
