import 'package:flutter/material.dart';

import 'constent.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.text, @required this.onpress});
  final String text;
  Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          height: kbotomContainerHeight,
          width: double.infinity,
          color: Colors.redAccent),
    );
  }
}
