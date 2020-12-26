import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  ReusableCard({@required this.colour, this.cardchild, this.ontap});
  final cardchild;
  Function ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: colour),
      ),
    );
  }
}
