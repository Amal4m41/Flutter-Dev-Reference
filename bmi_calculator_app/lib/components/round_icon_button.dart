import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/utils/constants.dart';

//Composing(using basic widgets to build our own widgets, rather than using an existing widget and overriding it's properties)
// a custom widget
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final onPressCallback actionOnPress;

  RoundIconButton({required this.icon, required this.actionOnPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: actionOnPress,
      child: Icon(
        icon,
        color: Colors.white,
        size: 40,
      ),
      fillColor: Color(0xff4C4F5e),
      shape: CircleBorder(),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
