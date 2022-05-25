import 'package:flutter/material.dart';
import 'package:future_stream_builder_demo/future_builder_demo.dart';
import 'package:future_stream_builder_demo/stream_builder_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Builder(builder: (context) {
        print('BUILDER BUILD');
        // var height = MediaQuery.of(context).size.height;
        // return FutureBuilderDemo();
        return StreamBuilderDemo();
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future? _futureValue;

  void _getFutureValue() {
    _futureValue = _fetchData();
    print("Called getFutureValue: $_futureValue");
  }

  Future<String> _fetchData() async {
    //delaying a bit so that the build function will be rebuild
    await Future.delayed(Duration(seconds: 1));
    throw Exception('This is an exception');
  }

  @override
  void initState() {
    // _futureValue = _fetchData();
    _getFutureValue();
    // someError();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD homescreen");
    print(_futureValue);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: _futureValue,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return Text('Result $_futureValue');
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('Some other state');
                }
              case ConnectionState.none:
                return Text('Waiting...');
              // case ConnectionState.active:
              //   // TODO: Handle this case.
              //   break;
              default:
                return Text('Default state');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _getFutureValue();
          });
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
