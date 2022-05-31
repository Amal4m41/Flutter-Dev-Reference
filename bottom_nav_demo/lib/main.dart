import 'package:bottom_nav_demo/some_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavBarLayout(),
    );
  }
}

class BottomNavBarLayout extends StatefulWidget {
  const BottomNavBarLayout({Key? key}) : super(key: key);

  @override
  State<BottomNavBarLayout> createState() => _BottomNavBarLayoutState();
}

class _BottomNavBarLayoutState extends State<BottomNavBarLayout> {
  static final List<Map<String, dynamic>> _screens = [
    {
      'label': 'Home',
      'icon': Icons.home_filled,
      'screen': HomeScreen(
        1,
        // key: UniqueKey(),
      ),
    },
    // {
    //   'label': 'Search',
    //   'icon': Icons.search,
    //   'screen': HomeScreen(
    //     2,
    //     key: UniqueKey(),
    //   ),
    // },
    {
      'label': 'Search',
      'icon': Icons.search,
      'screen': SomeScreen(1),
    },
    // {
    //   'label': 'Reels',
    //   // 'icon': Icons.add_box_outlined,
    //   'icon': Icons.slow_motion_video,
    //   'screen': HomeScreen(
    //     3,
    //     key: UniqueKey(),
    //   ),
    // }
  ];

  int _selectedScreenIndex = 0;

  @override
  void initState() {
    print("INIT STATE BOTTOM NAV BAR LAYOUT");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(_screens[_selectedScreenIndex]['label']);
    return Scaffold(
      body: IndexedStack(index: _selectedScreenIndex, children: _screens.map<Widget>((e) => e['screen']).toList()),
      bottomNavigationBar: SizedBox(
        // height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          onTap: (int index) => setState(() {
            _selectedScreenIndex = index;
          }),
          currentIndex: _selectedScreenIndex,
          items: _screens
              .map(
                (Map screen) => BottomNavigationBarItem(
                  icon: screen['icon'] is IconData
                      ? Icon(
                          screen['icon'],
                          size: 25,
                        )
                      : screen['icon'],
                  label: screen['label'],
                ),
              )
              .toList(),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          // selectedIconTheme: IconThemeData(color: Colors.white)),
        ),
      ),
    );
  }
}
