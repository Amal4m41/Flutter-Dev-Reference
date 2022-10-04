import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_in_depth_wax_app/providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SETTINGS SCREEN BUILD");
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Units"), DropDownWidget()],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Wax Lines"),
                FiltChipsWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FiltChipsWidget extends StatelessWidget {
  const FiltChipsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("FILTERCHIPS  BUILD");
    return Wrap(
      spacing: 5,
      runSpacing: 4,
      children: [
        FilterChip(
            label: Text("Swix"),
            selected:
                context.watch<SettingsProvider>().waxLines.contains("Swix"),
            selectedColor: Colors.lightBlueAccent.shade100,
            onSelected: (bool value) {
              context.read<SettingsProvider>().editWaxLines("Swix");
            }),
        FilterChip(
            label: Text("Toko"),
            selected:
                context.watch<SettingsProvider>().waxLines.contains("Toko"),
            selectedColor: Colors.lightBlueAccent.shade100,
            onSelected: (bool value) {
              context.read<SettingsProvider>().editWaxLines("Toko");
            }),
      ],
    );
  }
}

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("DROPDOWN  BUILD");
    return DropdownButton<String>(
      value: context.watch<SettingsProvider>().units,
      onChanged: (String? value) {
        if (value != null) {
          context.read<SettingsProvider>().setUnits(value);
        }
      },
      items: ["Metric", "Imperial"]
          .map<DropdownMenuItem<String>>(
              (String item) => DropdownMenuItem(child: Text(item), value: item))
          .toList(),
    );
  }
}
