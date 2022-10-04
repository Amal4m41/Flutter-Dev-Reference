import 'package:flutter/cupertino.dart';

class TextFieldProvider with ChangeNotifier {
  String _textValue = '';

  void setTextValue(String value) {
    _textValue = value;
    notifyListeners();
    // print(_textValue);
  }

  String getTextValue() => _textValue;
}
