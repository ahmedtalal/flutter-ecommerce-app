import 'package:e_commerce/Pages/Authentication/Login.dart';
import 'package:e_commerce/Pages/Authentication/Register.dart';
import 'package:e_commerce/Others/Constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomLinks extends StatelessWidget {
  String title, link;
  CustomLinks({@required this.title, @required this.link});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title.toLowerCase() == "login"
              ? "Do not have an account?"
              : "Do you have an account?",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: yuseiFont,
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            if (link.toLowerCase() == "login") {
              Navigator.of(context).pushReplacementNamed(Register.ID);
            } else if (link.toLowerCase() == "register") {
              Navigator.of(context).pushReplacementNamed(Login.ID);
            }
          },
          child: Text(
            title.toLowerCase() != "login"
                ? "Login"
                : "Register",
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              fontFamily: yuseiFont,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
