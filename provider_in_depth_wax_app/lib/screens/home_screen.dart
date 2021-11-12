import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_in_depth_wax_app/providers/settings_provider.dart';
import 'package:provider_in_depth_wax_app/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  HomeScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    print("HOMESCREEN BUILD");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              navigateTo(context, SettingsScreen());
            },
            child: Icon(Icons.settings),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        child: Center(
          //will only update/rebuild (the nearest build method) this widget if this specific value changes.
          child: Text(context.select((SettingsProvider value) => value.units)),
        ),
      ),
    );
  }
}

void navigateTo(BuildContext contextValue, Widget widget) {
  Navigator.push(
    contextValue,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
