import 'package:flutter/material.dart';
import '../Others/Constants.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String hint;
  IconData iconData;
  Function onClick;

  CustomTextFormField({
    @required this.hint,
    @required this.iconData,
    @required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: hint,
          prefixIcon: Icon(
            iconData,
            color: mainColor,
          ),
          labelStyle: TextStyle(
            fontFamily: yuseiFont,
          ),
          filled: true,
          fillColor: formColor,
        ),
        obscureText: hint.toLowerCase() == "password" ? true : false,
        keyboardType: hint.toLowerCase() == "name"
            ? TextInputType.text
            : TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return "this field is required";
          }
          return null;
        },
        onSaved: onClick,
      ),
    );
  }
}
