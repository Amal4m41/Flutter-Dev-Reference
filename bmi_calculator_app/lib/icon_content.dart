import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  color: Colors.white70,
  fontSize: 18,
);

class IconContent extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;

  IconContent({required this.cardIcon, required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(cardText, style: labelTextStyle)
      ],
    );
  }
}
