import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results page.dart';
import 'icon_content.dart';
import 'reusable.dart';
import 'BottomButton.dart';
import 'constants.dart';
import 'roundiconbutton.dart';
import 'calcuator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height = 180;
  int weight = 60;
  int age = 13;
  // Color malecardcolour = inactivecardColor;
  // Color femalecardcolour = inactivecardColor;
  // void updatecolour(Gender selectedgender) {
  //   if (selectedgender == Gender.male) {
  //     if (malecardcolour == inactivecardColor) {
  //       malecardcolour = activecardColor;
  //       femalecardcolour = inactivecardColor;
  //     } else {
  //       // ignore: unnecessary_statements
  //       malecardcolour == inactivecardColor;
  //     }
  //   }
  //   if (selectedgender == Gender.female) {
  //     if (femalecardcolour == inactivecardColor) {
  //       femalecardcolour = activecardColor;
  //       malecardcolour = activecardColor;
  //     } else {
  //       // ignore: unnecessary_statements
  //       femalecardcolour == inactivecardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusablecard(
                    ontap: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    colour: selectedgender == Gender.male
                        ? kactivecardColor
                        : kinactivecardColor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: reusablecard(
                    ontap: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    colour: selectedgender == Gender.female
                        ? kactivecardColor
                        : kinactivecardColor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusablecard(
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kfontstyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E99),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 22),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 320,
                      onChanged: (double newValue) {
                        //print(newValue);
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kactivecardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusablecard(
                    colour: kactivecardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kfontstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 19.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusablecard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kfontstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 19.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kactivecardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            ontap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiresult: calc.calculator(),
                    interpretation: calc.getInterpretation(),
                    resulttext: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
