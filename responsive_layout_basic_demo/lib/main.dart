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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(
        height); //780  height  of the entire screen(including notification bar)
    print(width); //360  width of the whole screen.
    print("BUILD HOMEPAGE");
    return Scaffold(
      appBar: AppBar(
        title: Text('UI DEMO'),
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? ListData()
          : GridData(),
    );
  }
}

class ListData extends StatelessWidget {
  const ListData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Person $index'),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.waves),
        );
      },
    );
  }
}

class GridData extends StatelessWidget {
  const GridData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 5,
      children: List.generate(
        21,
        (index) => ListTile(
          title: Text('Person $index'),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.waves),
        ),
      ),
    );
  }
}
