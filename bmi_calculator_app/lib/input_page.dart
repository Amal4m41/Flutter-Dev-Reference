import 'package:bmi_calculator_app/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';

enum enum_Gender {
  //defining  a list of named constants using enum for gender.
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  enum_Gender gender = enum_Gender.Male;
  double currentSliderValue = 170;

  bool isGenderMale() => gender == enum_Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    actionOnTap: () {
                      setState(() {
                        gender = enum_Gender.Male;
                      });
                    },
                    cardColor:
                        isGenderMale() ? kActiveCardColor : kInActiveCardColor,
                    cardChild: IconContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: "MALE",
                      iconAndTextColor: isGenderMale()
                          ? Colors.white
                          : const Color(0xff8D8E98),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      actionOnTap: () {
                        setState(() {
                          gender = enum_Gender.Female;
                        });
                      },
                      cardColor: isGenderMale()
                          ? kInActiveCardColor
                          : kActiveCardColor,
                      cardChild: IconContent(
                        cardIcon: FontAwesomeIcons.venus,
                        cardText: "FEMALE",
                        iconAndTextColor:
                            isGenderMale() ? Color(0xff8D8E98) : Colors.white,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: kCardTextSize),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        currentSliderValue.toString().split(".")[0],
                        style: kCardNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Slider(
                      value: currentSliderValue,
                      min: 100,
                      max: 250,
                      divisions: 150,
                      activeColor: Colors.red,
                      onChanged: (double value) {
                        setState(() {
                          currentSliderValue = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "CALCULATE YOUR BMI",
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
          )
        ],
      ),
    );
  }
}
