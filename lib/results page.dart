import 'BottomButton.dart';
import 'constants.dart';
import 'reusable.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiresult, this.interpretation, this.resulttext});
  final String bmiresult;
  final String resulttext;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: ktitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusablecard(
              colour: kactivecardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext.toUpperCase(),
                    style: kresultTextstyle,
                  ),
                  Text(
                    bmiresult,
                    style: kBMITextstyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kbodyTextstyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
