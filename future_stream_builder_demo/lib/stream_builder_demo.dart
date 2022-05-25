import 'dart:math';

import 'package:flutter/material.dart';

class StreamBuilderDemo extends StatefulWidget {
  const StreamBuilderDemo({Key? key}) : super(key: key);

  @override
  State<StreamBuilderDemo> createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<StreamBuilderDemo> {
  late Stream<int?> _streamData;

  Stream<int?> getDataFromNetworkCall() async* {
    print('started');
    await Future.delayed(Duration(seconds: 4));
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      // if (i == 2) throw Exception('sflksjfl');
      yield i == 1 ? null : i + 1;
    }
  }

  void assignStream() {
    _streamData = getDataFromNetworkCall();
  }

  @override
  void initState() {
    print('init');
    super.initState();
    assignStream();
  }

  @override
  Widget build(BuildContext context) {
    print('Build demo widget $_streamData');
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: StreamBuilder<int?>(
            // stream: getDataFromNetworkCall(),  //will start the stream afresh everytime we rebuild.
            // stream: _streamData.map<String?>((event) => event == null ? null : 'Number $event'),
            stream: _streamData,
            // initialData: 'Starting value',
            builder: (context, snapshot) {
              print('build future builder');
              switch (snapshot.connectionState) {
                case ConnectionState.none: //when stream is null. i.e. stream: null (not the value of a stream data)
                  return const Text('Stream is null');
                case ConnectionState.waiting: //the waiting state till the first value is returned by the stream.
                  return
                      // snapshot.hasData
                      //   ? Text('Data is here: ${snapshot.data}')
                      //   :
                      Text('Waiting...\n'
                          'Error: ${snapshot.error}\n'
                          'Data: ${snapshot.data}\n');
                // case ConnectionState
                //     .active: //in active state once we receive the first value of a stream and till the stream is
                //   //finished(till the last value is returned, which is the connectionstate.done state).
                //   if (snapshot.hasError) {
                //     return Text('Error ${snapshot.error}');
                //   } else if (snapshot.hasData) {
                //     return Text('Data ${snapshot.data}');
                //   } else {
                //     return Text('Data is null ${snapshot.data}');
                //   }
                // case ConnectionState
                //     .done: //steam is in complete state, i.e the last value returned can be received here.
                //   if (snapshot.hasError) {
                //     return Text('Last Error ${snapshot.error}');
                //   } else if (snapshot.hasData) {
                //     return Text('Last Data ${snapshot.data}');
                //   } else {
                //     return Text('Last Data is null ${snapshot.data}');
                //   }
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
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              assignStream();
            });
          },
        ),
      ),
    );
  }
}
