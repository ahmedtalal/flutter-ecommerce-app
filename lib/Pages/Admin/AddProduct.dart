import 'package:e_commerce/Widgets/CustomTextFormField.dart';
import 'package:e_commerce/Others/Constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
  static const String ID = "addProduct";
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var heightValue = MediaQuery.of(context).size.height;
    var widthValue = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: heightValue * 0.12,
          horizontal: widthValue * 0.05,
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widthValue * 0.024,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30.0,
                      color: Colors.black,
                    ),
                    onTap: () => Navigator.of(context).pop(context),
                  ),
                  SizedBox(
                    width: widthValue * 0.02,
                  ),
                  Text(
                    "Add Product",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: yuseiFont,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: heightValue * 0.03,
            ),
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/admin.png"),
                radius: 45.0,
              ),
            ),
            SizedBox(
              height: heightValue * 0.03,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hint: "name",
                    iconData: Icons.add,
                    onClick: (value) {},
                  ),
                  SizedBox(
                    height: heightValue * 0.02,
                  ),
                  CustomTextFormField(
                    hint: "price",
                    iconData: Icons.add,
                    onClick: (value) {},
                  ),
                  SizedBox(
                    height: heightValue * 0.02,
                  ),
                  CustomTextFormField(
                    hint: "description",
                    iconData: Icons.add,
                    onClick: (value) {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightValue * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthValue * 0.20),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                  child: Text(
                    "Add Product",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: yuseiFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
