import 'package:flutter/material.dart';

typedef onTapCallback = void Function(String value);

void main() {
  runApp(const MyApp());
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

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String data = "Lionel Messi";

  void onTapButtonCallBack(String value) {
    setState(() {
      data = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Building MainPage');
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
      ),
      body: Screen2(
        data: data,
        callback: onTapButtonCallBack,
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  final String data;
  final onTapCallback callback;

  const Screen2({Key? key, required this.data, required this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Building Screen2');
    return Container(
      child: Screen3(
        data: data,
        callback: callback,
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  final String data;
  final onTapCallback callback;
  const Screen3({Key? key, required this.data, required this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Building Screen3');
    return Container(
      child: Screen4(data: data, callback: callback),
    );
  }
}

class Screen4 extends StatelessWidget {
  final String data;
  final onTapCallback callback;
  const Screen4({Key? key, required this.data, required this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Building Screen4');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data),
          ElevatedButton(
            onPressed: () {
              callback("neymar");
            },
            child: Text('Change data'),
          ),
        ],
      ),
    );
  }
}
