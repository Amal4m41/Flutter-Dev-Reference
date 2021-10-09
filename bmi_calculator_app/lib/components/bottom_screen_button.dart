import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/utils/constants.dart';

class BottomScreenButton extends StatelessWidget {
  final String text;
  final onPressCallback actionOnPress;

  BottomScreenButton({
    required this.text,
    required this.actionOnPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actionOnPress,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
              wordSpacing: 3,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        color: Color(0xf0EB1555),
        height: kCalculateBmiButtonHeight,
        width: double.infinity,
      ),
    );
  }
}
