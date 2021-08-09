import 'package:flutter/material.dart';

// ignore: camel_case_types
class reusablecard extends StatelessWidget {
  reusablecard({this.colour, this.cardchild, this.ontap});
  final Color colour;
  final Widget cardchild;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
