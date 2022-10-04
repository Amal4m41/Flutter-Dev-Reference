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
      create: (_) => AppDataDifferent(),
      child: ChangeNotifierProvider(
        create: (_) => AppData(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const TextWidgetOne(), //watch is same as Provider.of... with listen = true.
            ),
            body: Screen2(),
          );
        },
      ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidgetTwo(), //A listener.
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
          Container(
            height: 10,
            width: double.infinity,
            color: Colors.red,
          ),
          Builder(builder: (context) {
            print('new app data listener widget text');
            return Text(context.watch<AppDataDifferent>().name);
          }),
          ElevatedButton(
            onPressed: () {
              //context.read is same as Provider.of.. listen is set to 'false'.
              context.read<AppDataDifferent>().changeData("BBB");
            },
            child: Text("Notify listeners of AppDataDifferent"),
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

  void justForFun() {
    notifyListeners();
  }

  String get name => _name;
}

class AppDataDifferent with ChangeNotifier {
  String _name = "AAA";

  void changeData(String value) {
    _name = value;
    notifyListeners();
  }

  void justForFun() {
    notifyListeners();
  }

  String get name => _name;
}
