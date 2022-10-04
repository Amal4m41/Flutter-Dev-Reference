import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  ListViewDemo({Key? key}) : super(key: key);

  final List widgets = [
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
    PostItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // ListView(
          //   addAutomaticKeepAlives: false,
          //   children: [
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //     PostItem(),
          //   ],
          // ),
          ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, index) => widgets[index],
      ),
    );
  }
}

int count = 0;

class PostItem extends StatelessWidget {
  PostItem({Key? key}) : super(key: key) {
    count++;
    print('POST ITEM CONSTRUCTOR $count');
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD ');
    return Container(
      height: 300,
      color: Colors.red,
      child: InkWell(
          onTap: () {
            // setState(() {
            //   c++;
            // });
          },
          child: Text('PostItem here ')),
    );
  }
}
