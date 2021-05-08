import 'package:flutter/material.dart';
import '../constants.dart';
import '../Components/reuseableCard.dart';
import '../Components/bottomButton.dart';


class Resultspage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const Resultspage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

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
                child: Center(
                  child: Text('Your Result',
                  style:  kTitleTextStyle,),
                ),
              )
          ),
          Expanded(
            flex: 5,
              child: ReuseableCard(
                colour: kInactiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(), style: kResultTextStyle,),
                    Text(bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(interpretation, textAlign: TextAlign.center,
                      style: kBodyTextStyle,),
                  ],
                ),

              )),
          BottomButton(onTap: (){
            Navigator.pop(context);
          },
          buttonTitle: 'RE-CALCULATE',)
        ],
      ),
    );
  }
}
