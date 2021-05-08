
import 'package:bmi_calculator_app/Screens/results_page.dart';
import 'package:bmi_calculator_app/Components/reuseableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/IconButton.dart';
import '../Components/bottomButton.dart';
import '../constants.dart';
import '../Components/icon_content.dart';
import 'package:bmi_calculator_app/calculator_brain.dart';


enum Gender{ male, female, }


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  // void updateColor(Gender selectedGender){
  //   if(selectedGender == Gender.male){ //male card pressed
  //     if(maleCardColor == inactiveCardColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if(selectedGender == Gender.female){ //female card pressed
  //     if(femaleCardColor == inactiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     }
  //   } else{
  //     femaleCardColor = inactiveCardColor;
  //   }
  // }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      title: Text('BMI CALCULATOR'),
    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Expanded(child: Row(children: [
           //CARD-1 MALE
           Expanded(child:
           ReuseableCard(
             //Ternary operator has the benefit that Gender has no value when the app starts out.. selectedGender is not gonna value of male or female so both cards will starts out with inactiveCardColor.
             onPress: (){
               setState(() {
                 selectedGender = Gender.male;
               });
             },
             colour: selectedGender == Gender.male? kActiveCardColor : kInactiveCardColor,
             childCard: IconContent(icon: FontAwesomeIcons.mars,
             label: 'MALE',),
           )),

           //CARD-2 FEMALE
           Expanded(child:
           ReuseableCard(
             onPress: (){
               setState(() {
                 selectedGender = Gender.female;
               });
             },
             colour: selectedGender == Gender.female? kActiveCardColor: kInactiveCardColor,
             childCard: IconContent(icon: FontAwesomeIcons.venus,
               label: 'FEMALE',),
           ))
         ],)),

          //CARD-3
          Expanded(child:
          ReuseableCard(colour: kInactiveCardColor,
          childCard: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HEIGHT', style: kLabelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //along the length of the row
                crossAxisAlignment: CrossAxisAlignment.baseline, //along the short side width of the row
                textBaseline: TextBaseline.alphabetic, //for alphabetic characters and ideographic for graphical characters.
                children: [
                  Text(height.toString(), style: kNumberCardStyle),
                  Text('cm', style: kLabelTextStyle,)],),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  activeTrackColor: Color(0xFFFAE160),
                  inactiveTrackColor: Colors.white70,
                  thumbColor: Color(0xFFFAE160),
                  overlayColor:  Color(0x29FAE160) // 0x29 . alpha value which gives 16% of opacity.
                ),
                child: Slider(
                  //int can't be assign in double that's why we converted int into double
                  value: height.toDouble(),
                  min: 120.0, //  scale height
                  max: 220.0,
                  //newValue will be passed to us from the slider when the slider gets changed by the user.
                  onChanged: (double newValue){
                    setState(() {
                      height = newValue.round();// becomes integer
                    });
                  },
                ),
              ),
            ],
          ),
          )),


          Expanded(child: Row(children: [
            //CARD-4
            Expanded(child:
            ReuseableCard(
                colour: kInactiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('WEIGHT', style: kLabelTextStyle,),
                  Text(weight.toString(), style: kNumberCardStyle,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedIconButton(icons: FontAwesomeIcons.minus,
                      onPressed: (){
                        setState(() {
                          weight--;
                        });
                      },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundedIconButton(icons: FontAwesomeIcons.plus,
                      onPressed: (){
                        setState(() {
                          weight++;
                        });
                      },),
                    ],
                  )
                ],
              ),
            )),
            //CARD-5
            Expanded(child:
            ReuseableCard(colour: kInactiveCardColor,
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('AGE', style: kLabelTextStyle,),
                Text(age.toString(), style: kNumberCardStyle),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedIconButton(
                        icons: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            age--;
                          });
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    RoundedIconButton(
                        icons: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        })
                  ],
                )
              ],
            ),
            )),
          ],)),
          BottomButton(
            onTap: (){
              //object from a constructor of the calculator brain class
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Resultspage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResults(),
                interpretation: calc.getInterpretation(),
              ),)
              );
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}








