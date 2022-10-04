import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

//testing a single subscription stream as broadcast stream.
class StreamDemoThree extends StatefulWidget {
  const StreamDemoThree({Key? key}) : super(key: key);

  @override
  State<StreamDemoThree> createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemoThree> {
  final StreamController<int> _streamController = StreamController<int>(); //single subscription stream controller.
  // final StreamController<int> _streamController = StreamController<int>.broadcast();
  late StreamSubscription _subscriptionOne;
  late StreamSubscription _subscriptionTwo;
  late Stream<int> _broadcastStream;
  int _counter = 0;

  void getBroadCastSubscription() {
    _broadcastStream = _streamController.stream.asBroadcastStream();
    // _subscription = _broadcastStream.listen((event) {
    //   print('Value from stream $event');
    // });
  }

  @override
  void initState() {
    print('init');
    super.initState();
    getBroadCastSubscription();
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
                  _subscriptionOne = _broadcastStream.listen((event) {
                    print('First subscription : $event');
                  });
                },
                child: Text('First Subscribe'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
              ),
              TextButton(
                onPressed: () {
                  _subscriptionTwo = _broadcastStream.listen((event) {
                    print('Second subscription : $event');
                  });
                },
                child: Text('Second Subscribe'),
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
                  // print(_subscription);
                  _subscriptionOne.cancel();
                },
                child: Text('Unsubscribe First'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              ),
              TextButton(
                onPressed: () {
                  //unsubscribe from this stream to stop listening to the events.
                  // print(_subscription);
                  _subscriptionTwo.cancel();
                },
                child: Text('Unsubscribe Second'),
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
