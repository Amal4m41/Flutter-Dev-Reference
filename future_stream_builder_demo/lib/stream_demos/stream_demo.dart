import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

//using stream controller to create and control a stream
class StreamDemo extends StatefulWidget {
  const StreamDemo({Key? key}) : super(key: key);

  @override
  State<StreamDemo> createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  final StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;

  @override
  void initState() {
    print('init');
    super.initState();
    // assignStream();
  }

  @override
  Widget build(BuildContext context) {
    // print('Build demo widget $_streamData');
    print('Build demo widget');
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: StreamBuilder<int>(
            stream: _streamController.stream,
            // initialData: 'Starting value',
            builder: (context, snapshot) {
              print('build stream builder');
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
            _streamController.sink.add(_counter++);
            // setState(() {
            //   assignStream();
            // });
          },
        ),
      ),
    );
  }
}
