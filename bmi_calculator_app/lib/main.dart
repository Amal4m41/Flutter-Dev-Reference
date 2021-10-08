import 'package:bmi_calculator_app/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff090C22),
        scaffoldBackgroundColor: Color(0xff090C22),
      ),
      home: InputPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/result': (context) => ResultPage()
      // },
    );
  }
}
