import 'package:bmi_calculator/constent.dart';
import 'package:bmi_calculator/containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bottom_Button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.result, this.interpritation, this.body});
  final result;
  final interpritation;
  final body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(15),
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(interpritation,
                      style: kResultTextStyle, textAlign: TextAlign.center),
                  Text(result,
                      style: kBMITextStyle, textAlign: TextAlign.center),
                  Text(body, textAlign: TextAlign.center, style: kBodyTextStyle)
                ],
              ),
              colour: kinactiveCardColor,
            ),
          ),
          BottomButton(
              text: 'RE-CALCULATE',
              onpress: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
