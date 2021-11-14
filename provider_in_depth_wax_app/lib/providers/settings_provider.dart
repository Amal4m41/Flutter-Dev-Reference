import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  late String _units;
  late List<String> _waxLines;

  SettingsProvider() {
    _units = "Metric";
    _waxLines = ["Swix", "Toko"];
    loadPreferences();
  }

  //Getters
  String get units => _units;
  List<String> get waxLines => _waxLines;

  //Setters
  void setUnits(String units) {
    _units = units;
    notifyListeners();
    savePreferences();
  }

  void editWaxLines(String value) {
    //To remove/add waxlines from the list.
    _waxLines.contains(value) ? _waxLines.remove(value) : _waxLines.add(value);

    notifyListeners();
    savePreferences();
  }

  //Shared preferences

  void savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("units", units);
    prefs.setStringList("waxLines", waxLines);
  }

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? unitsValue = prefs.getString("units");
    List<String>? waxLinesValue = prefs.getStringList("waxLines");

    //if the values are not null (i.e. sharedPreference was set before) then take that as the default values.
    if (waxLinesValue != null) _waxLines = waxLinesValue;
    if (unitsValue != null) setUnits(unitsValue);
  }
}
