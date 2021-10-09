import 'package:flutter/material.dart';

// Signature of callbacks that have no arguments and return no data.
typedef onPressCallback = void Function();

const double kCalculateBmiButtonHeight = 80.0;
const Color kActiveCardColor = Color(0xff1D1F33);
const Color kInActiveCardColor = Color(0xff111328);
const double kCardTextSize = 18.0;

const TextStyle kCardNumberStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const TextStyle kResultDescriptionTextStyle = TextStyle(
  fontSize: 22,
);
