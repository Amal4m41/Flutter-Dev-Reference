import 'package:flutter/material.dart';
import '../utils/constants.dart';

class IconContent extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;
  final Color iconAndTextColor;

  IconContent(
      {required this.cardIcon,
      required this.cardText,
      required this.iconAndTextColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
          color: iconAndTextColor,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          cardText,
          style: TextStyle(
            color: iconAndTextColor,
            fontSize: kCardTextSize,
          ),
        )
      ],
    );
  }
}
