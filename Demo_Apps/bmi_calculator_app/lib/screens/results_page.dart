// import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/utils/constants.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_calculator_app/components/bottom_screen_button.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String resultDescription;

  ResultPage({
    required this.bmi,
    required this.result,
    required this.resultDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: Text(
              "Your Result",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
              cardChild: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result.toUpperCase(),
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 90),
                    ),
                    Column(
                      children: [
                        Text(
                          "Normal BMI range:",
                          style:
                              TextStyle(color: Color(0xff8D8E98), fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "18.5 - 25 kg/m2",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Text(
                      resultDescription,
                      style: kResultDescriptionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomScreenButton(
            text: "RE-CALCULATE YOUR BMI",
            actionOnPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
