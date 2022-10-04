import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

//playing around with subscribing and closing a stream.
class StreamDemoTwo extends StatefulWidget {
  const StreamDemoTwo({Key? key}) : super(key: key);

  @override
  State<StreamDemoTwo> createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemoTwo> {
  // final StreamController<int> _streamController = StreamController<int>(); //single subscription stream controller.
  final StreamController<int> _streamController = StreamController<int>.broadcast();
  late StreamSubscription _subscription;
  int _counter = 0;

  void subscribe() {
    final Stream<int> _stream = _streamController.stream;
    _subscription = _stream.listen((event) {
      print('Value from stream $event');
    });
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  subscribe();
                },
                child: Text('Subscribe'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
              ),
              TextButton(
                onPressed: () {
                  int randomNumber = Random().nextInt(100);
                  _streamController.add(randomNumber);
                },
                child: Text('Add Value'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
              ),
              TextButton(
                onPressed: () {
                  //unsubscribe from this stream to stop listening to the events.
                  print(_subscription);
                  _subscription.cancel();
                },
                child: Text('Unsubscribe'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.refresh),
        //   onPressed: () {
        //     _streamController.sink.add(_counter++);
        //     // setState(() {
        //     //   assignStream();
        //     // });
        //   },
        // ),
      ),
    );
  }
}
