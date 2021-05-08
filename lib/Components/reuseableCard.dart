import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {

  //PROPERTY Color(0xFFFD8756)
  final Color colour;
  final Widget childCard;
  final Function onPress;

//CONSTRUCTOR
  const ReuseableCard({@required this.colour, this.childCard, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}
