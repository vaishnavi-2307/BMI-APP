import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    this.ontap,
    this.buttonTitle,
  });
  final Function ontap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: klargeButtonTextStyle,
        )),
        color: kbottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
