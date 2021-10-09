import 'package:bmi_calculator_app/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light().copyWith(primary: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: Color(0xff090C22),
      ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.dark(primary: Color(0xFFffffff)),
      //   scaffoldBackgroundColor: const Color(0xFF0A0E21),
      // ),
      home: InputPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/result': (context) => ResultPage()
      // },
    );
  }
}
