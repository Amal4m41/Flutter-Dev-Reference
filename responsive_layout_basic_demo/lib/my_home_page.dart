import 'package:flutter/material.dart';

//Comparing MediaQuery and LayoutBuilder.

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    // print(
    //     'Media Query height : $height'); //780  height  of the entire screen(including notification bar)
    // print('Media Query width $width'); //360  width of the whole screen.
    print("BUILD HOMEPAGE");
    return Scaffold(
      appBar: AppBar(
        title: Text('UI DEMO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(builder: (context, constraints) {
          // print(constraints.maxHeight);
          print('Media : ${MediaQuery.of(context).size.width}');
          print('Builder: ${constraints.maxWidth}');
          print("LAYOUT BUILDER BUILD");

          final width = constraints.maxWidth;

          if (width > 1200) {
            return GridData(8);
          } else if (width > 700) {
            return const GridData(5);
          }
          return const ListData(5);
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          value++;
        });
      }),
    );
  }
}

class ListData extends StatefulWidget {
  final int value;
  const ListData(this.value);

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('LIST DATA BUILD');
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Person $index, Count: $counter, Value: ${widget.value}'),
          leading: Icon(Icons.person),
          trailing: IconButton(
              onPressed: () => setState(() {
                    counter++;
                  }),
              icon: Icon(Icons.add)),
        );
      },
    );
  }
}

class GridData extends StatelessWidget {
  final double aspectRatio;

  const GridData(this.aspectRatio);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: aspectRatio,
      children: List.generate(
        21,
        (index) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            print("HEY");
            // print(constraints.maxWidth);
            // print(constraints.maxHeight);
            return ListTile(
              title: Text('Person $index'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.waves),
            );
          },
        ),
      ),
    );
  }
}
