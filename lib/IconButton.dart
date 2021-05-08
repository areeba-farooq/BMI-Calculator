import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icons;
  final Function onPressed;

  const RoundedIconButton({@required this.icons, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:onPressed,
      elevation: 6.0,
      fillColor: Color(0xFFFAE160),
      shape: CircleBorder(),
      child: Icon(icons,
        color: Color(0xFFFD7A45),),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),

    );
  }
}