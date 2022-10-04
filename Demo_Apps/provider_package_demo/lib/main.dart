import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_package_demo/providers/text_field_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TextFieldProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String data = "My secret data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(context.watch<TextFieldProvider>().getTextValue()),
        ),
        body: Level1(),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level2();
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextField(
            onChanged: (String value) {
              //Accessing the provider methods.
              context.read<TextFieldProvider>().setTextValue(value);
            },
          ),
        ),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(context.watch<TextFieldProvider>().getTextValue());
  }
}
