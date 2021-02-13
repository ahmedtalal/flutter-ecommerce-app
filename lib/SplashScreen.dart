import 'package:e_commerce/Firebase/AuthBuilder/AuthServices.dart';
import 'package:e_commerce/InternetConnection.dart';
import 'package:e_commerce/Pages/Admin/DashBoard.dart';
import 'package:e_commerce/Pages/Authentication/Login.dart';
import 'package:e_commerce/Others/Constants.dart';
import 'package:e_commerce/Pages/Clients/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  static const String ID = "splashScreen";
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var heightValue = MediaQuery.of(context).size.height;
    var widthValue = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: mainColor,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        label: Text(
          "Get started",
          style: TextStyle(
            fontSize: 16,
            fontFamily: yuseiFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async{
          var result = await AuthServices.getInstance().checkUserAuth();
          if (await InternetConnection.getInstance().checkConnection() ==true) {
            if (result == true) {
              if (FirebaseAuth.instance.currentUser.email ==
                  "admin@gmail.com") {
                Navigator.of(context).pushReplacementNamed(DashBoard.ID);
              } else {
                Navigator.of(context).pushReplacementNamed(Home.ID);
              }
            } else {
              Navigator.of(context).pushReplacementNamed(Login.ID);
            }
          } else {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("there is a problem in internet connection"),
              ),
            );
          }
        },
      ),
      body: ListView(
        children: [
          SizedBox(
            height: heightValue * 0.14,
          ),
          Container(
            height: heightValue * 0.27,
            width: widthValue * 0.1,
            child: SvgPicture.asset("assets/images/shopping.svg"),
          ),
          SizedBox(
            height: heightValue * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthValue * 0.2),
            child: Text(
              "Online Shopping",
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: yuseiFont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
