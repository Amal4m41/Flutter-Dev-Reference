import 'package:flutter/material.dart';
import 'package:statefulwidget_lifecycle_demo/main3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("FSDLKFJSDL");
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_MyHomePageState BUILD");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // MyStatelessWidget(_counter),
            MyStatefulWidget(_counter),
            MyStatefulWidget(5),
            const SimpleStatelessWidget(2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// class MyStatelessWidget extends StatelessWidget {
//   final int count;
//   const MyStatelessWidget(this.count);
//
//   @override
//   Widget build(BuildContext context) {
//     print("MyStatelessWidget");
//     return Container(
//       child: Text("MyStatlessWiddget $count"),
//     );
//   }
// }

class MyStatefulWidget extends StatefulWidget {
  final int value;

  // const MyStatefulWidget(this.value);

  MyStatefulWidget(this.value) {
    print('MyStatefulWidget constructor $value');
  }

  @override
  _MyStatefulWidgetState createState() {
    print("CREATE STATE");
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int dummyvalue = 0;

  _MyStatefulWidgetState() {
    print("state constructor");
  }

  @override
  void initState() {
    super.initState();
    print('MyStatefulWidget initState');
  }

  @override
  void didUpdateWidget(covariant MyStatefulWidget oldWidget) {
    print("didUpdateWidget");
    print(widget.value);
    print(oldWidget.value);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("MyStatefulWidget BUILD");
    return Container(
      child: Column(
        children: [
          Text("MyStatefulWidget ${widget.value}, dummy value = $dummyvalue"),
          TextButton(
              onPressed: () {
                setState(() {
                  dummyvalue += 1;
                });
              },
              child: Text("CLICK ME"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("DISPOSE $dummyvalue");
  }
}

class SimpleStatelessWidget extends StatelessWidget {
  final _countValue;
  const SimpleStatelessWidget(this._countValue, {Key? key});

  @override
  Widget build(BuildContext context) {
    print('SimpleStatelessWidget BUILD');
    return Container(
      child: Text('Stateless one here! $_countValue'),
    );
  }
}
