import 'package:bmi_calculator_app/components/icon_content.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

//StatelessWidgets are immutable, once they're created they can't be changed, therefore whenever ever there's a change in it's
//property for example color, then the object is destroyed and a new object of that widget with the new color is created and
//updated in the widget tree.
class ReusableCard extends StatelessWidget {
  final Color cardColor; //we initialize it in the constructor.
  final Widget? cardChild;
  final onPressCallback? actionOnTap;
  final EdgeInsets margin;

  ReusableCard({
    this.cardColor = const Color(0xff1D1F33),
    this.cardChild,
    this.actionOnTap,
    this.margin = const EdgeInsets.all(15),
  }); //providing a default value for the constructor parameter.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actionOnTap, //if it's not null the execute this function on tap
      child: Container(
        child: cardChild,
        margin: margin,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
