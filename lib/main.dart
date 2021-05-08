import 'package:flutter/material.dart';
import 'Screens/inputpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFFAE160),
          scaffoldBackgroundColor: Color(0xFFFAE160)
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}



