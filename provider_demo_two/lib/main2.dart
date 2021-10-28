import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            title: Text(Provider.of<AppData>(context, listen: true).name),
          ),
          body: Screen2(),
        );
      },
    );
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
          Text(Provider.of<AppData>(context, listen: true).name), //A listener.
          ElevatedButton(
            onPressed: () {
              //Make sure listen is set to 'false'.
              Provider.of<AppData>(context, listen: false).changeData("Messi");
            },
            child: Text("Change data"),
          ),
        ],
      ),
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
