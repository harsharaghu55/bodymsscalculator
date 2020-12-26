import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Bottom_Button.dart';
import 'Resulat_page.dart';
import 'calculator_Brain.dart';
import 'constent.dart';
import 'containers.dart';
import 'icons.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender userSelectedgender;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    ontap: () {
                      setState(() {
                        userSelectedgender = Gender.male;
                      });
                    },
                    colour: userSelectedgender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardchild:
                        IconContens(icon: FontAwesomeIcons.male, text: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      ontap: () {
                        setState(() {
                          userSelectedgender = Gender.female;
                        });
                      },
                      colour: userSelectedgender == Gender.female
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardchild: IconContens(
                          icon: FontAwesomeIcons.female, text: 'FEMALE')),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kinactiveCardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: klabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: knumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.50),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25.0),
                        activeTrackColor: Colors.white),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 320,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        // print(newValue);
                        setState(() {
                          height = newValue.round();
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
                  child: ReusableCard(
                    colour: kinactiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: klabelTextStyle),
                        Text(weight.toString(), style: knumberTextStyle),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 5),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kinactiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: klabelTextStyle),
                        Text(age.toString(), style: knumberTextStyle),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE YOUR BMI',
            onpress: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      result: calc.calculateBMI(),
                      interpritation: calc.getResult()[0],
                      body: calc.getResult()[1]),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onpressed});
  IconData icon;
  Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        elevation: 6.0,
        onPressed: onpressed,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0));
  }
}
