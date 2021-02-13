import 'package:e_commerce/Others/Constants.dart';
import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.33,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/buyIcon.png"),
          ),
          Text(
            "Buy it",
            style: TextStyle(
              fontFamily: pacificoFont,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
