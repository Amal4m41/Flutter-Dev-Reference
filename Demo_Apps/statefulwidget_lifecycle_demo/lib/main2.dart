import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // MyStatelessWidget(_counter),
            MyStatefulWidget(),
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

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() {
    print("CREATE STATE");
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int dummyvalue = 0;

  @override
  void initState() {
    super.initState();
    print('MyStatefulWidget initState');
  }

  @override
  void didUpdateWidget(covariant MyStatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('MyStatefulWidget  didUpdate Widget');
  }

  @override
  Widget build(BuildContext context) {
    print("MyStatefulWidget BUILD");
    return Container(
      child: Column(
        children: [
          Text("MyStatefulWidget dummy value = $dummyvalue"),
          TextButton(
            onPressed: () {
              setState(() {
                dummyvalue += 1;
              });
            },
            child: Text("CLICK ME"),
          ),
          WidgetTwo(dummyvalue),
        ],
      ),
    );
  }
}

class WidgetTwo extends StatefulWidget {
  final countValue;
  const WidgetTwo(this.countValue);

  @override
  _WidgetTwoState createState() {
    print("WIDGET TWO create state");
    return _WidgetTwoState();
  }
}

class _WidgetTwoState extends State<WidgetTwo> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('WIDGET TWO  initState');
  }

  @override
  void didUpdateWidget(covariant WidgetTwo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('WIDGET TWO  didUpdate Widget');
  }

  @override
  Widget build(BuildContext context) {
    print("WIDGET TWO BUILD");
    return Container(
      child: Column(
        children: [
          Text(
              "WIDGET TWO dummy value = $counter, dummy value = ${widget.countValue}"),
          TextButton(
              onPressed: () {
                setState(() {
                  counter += 1;
                });
              },
              child: Text("CLICK ME"))
        ],
      ),
    );
  }
}
