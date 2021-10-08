import 'package:bmi_calculator_app/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';

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
  double currentSliderValueHeight = 170;
  int weight = 60;
  int age = 20;

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
                        currentSliderValueHeight.toString().split(".")[0],
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
                    child: SliderTheme(
                      //if we want to change just a specific widget's theme, then we wrap it with the theme.
                      data: SliderThemeData(
                          inactiveTrackColor: Color(0xff8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Colors.red,
                          overlayColor: Color(0x1ff44336),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: currentSliderValueHeight,
                        min: 100,
                        max: 250,
                        divisions: 150,
                        onChanged: (double value) {
                          setState(() {
                            currentSliderValueHeight = value;
                          });
                        },
                      ),
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
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: kCardTextSize),
                        ),
                        Text(
                          weight.toString(),
                          style: kCardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              actionOnPress: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                              icon: Icons.remove,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              actionOnPress: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(fontSize: kCardTextSize),
                        ),
                        Text(
                          age.toString(),
                          style: kCardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              actionOnPress: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                              icon: Icons.remove,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              actionOnPress: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(),
                ),
              );
              print("HELLOW");
              // Navigator.pushNamed(context, '/result');
            },
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }
}

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
