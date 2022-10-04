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
    print('Building MainPage');
    return Scaffold(
      appBar: AppBar(
        title: Text('sample screen'), //watch is same as Provider.of... with listen = true.
      ),
      body: Screen2(),
    );
  }
}

class TextWidgetOne extends StatelessWidget {
  const TextWidgetOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building textwidget 1");
    return Text(context.watch<AppData>().name);
  }
}

class TextWidgetTwo extends StatelessWidget {
  const TextWidgetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building textwidget 2");
    // return Text(context.watch<AppData>().name);
    //rebuild only when the name property changes.
    return Text(context.select((AppData data) => data.name));
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
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Screen5()));
        },
        child: Text("Move to new screen"),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building Screen5');
    return ChangeNotifierProvider(
        create: (context) => AppData(),
        builder: (context, _) {
          print('change notifier build');
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidgetTwo(),
                  Builder(builder: (context) {
                    print('BUILDER COUNT');
                    return Text(context.watch<AppData>().count.toString());
                  }), //A lis
                  Builder(builder: (context) {
                    print('BUILDER NAME');
                    return Text(context.watch<AppData>().name);
                  }),

                  /// tener.
                  ElevatedButton(
                    onPressed: () {
                      //context.read is same as Provider.of.. listen is set to 'false'.
                      context.read<AppData>().changeData("Ronaldo");
                    },
                    child: Text("Change data"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //context.read is same as Provider.of.. listen is set to 'false'.
                      // context.read<AppData>().changeData("Messi");
                      context.read<AppData>().justForFun();
                      String stringValue = context.read<AppData>().name;
                      print('Current value: $stringValue');
                    },
                    child: Text("Notify listeners simply"),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class AppData with ChangeNotifier {
  String _name = "Neymar";
  int count = 0;

  AppData() {
    print('APPDATA constructor');
  }

  void changeData(String value) async {
    _name = value;
    await Future.delayed(Duration(seconds: 3));
    notifyListeners();
  }

  void justForFun() {
    count++;
    notifyListeners();
  }

  @override
  void dispose() {
    print('DISPOSE');
  }

  String get name => _name;
}
