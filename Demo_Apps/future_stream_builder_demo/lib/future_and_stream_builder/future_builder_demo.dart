import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderDemo extends StatefulWidget {
  const FutureBuilderDemo({Key? key}) : super(key: key);

  @override
  State<FutureBuilderDemo> createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  late Future<String?> _futureData;

  Future<String?> getDataFromNetworkCall() async {
    print('start');
    await Future.delayed(Duration(seconds: 4));
    Random random = new Random();
    int randomNumber = random.nextInt(200); // f
    // throw Exception('lol');
    return 'Network result -> $randomNumber';
  }

  @override
  void initState() {
    print('init');
    super.initState();
    _futureData = getDataFromNetworkCall();
  }

  @override
  Widget build(BuildContext context) {
    print('Build demo widget $_futureData');
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder<String?>(
            // future: getDataFromNetworkCall(),
            future: _futureData,
            // initialData: 'Starting value',
            builder: (context, snapshot) {
              print('build future builder');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: //future is in incomplete state
                  return
                      // snapshot.hasData
                      //   ? Text('Data is here: ${snapshot.data}')
                      //   :
                      Text('Waiting...\n'
                          'Error: ${snapshot.error}\n'
                          'Data: ${snapshot.data}\n');
                case ConnectionState.done: //future is in complete state.
                default:
                  if (snapshot.hasError) {
                    //error!=null
                    return (Text('Error 😢: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    //data!=null
                    return (Text('Data ✔: ${snapshot.data}'));
                  } else {
                    //when data is null(if our future could return a null value)
                    return Text('Data is null');
                  }
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              _futureData = getDataFromNetworkCall();
            });
          },
        ),
      ),
    );
  }
}
