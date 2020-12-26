import 'package:flutter/material.dart';

import 'constent.dart';

class IconContens extends StatelessWidget {
  final icon;
  final text;
  IconContens({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0),
        SizedBox(height: 15),
        Text(
          text,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
