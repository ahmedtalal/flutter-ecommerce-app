import 'package:e_commerce/SplashScreen.dart';
import 'package:e_commerce/Firebase/AuthBuilder/AuthServices.dart';
import 'package:e_commerce/Others/Constants.dart';
import 'package:e_commerce/Widgets/CustomCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashBoard extends StatelessWidget {
  static const String ID = "dashBoard";
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  String addTile = "Add Product";
  String deleteTile = "Delete Product";
  String updateTitle = "Update Product";
  String listTitle = "Product List";
  String addImage = "assets/images/add.png";
  String deleteImage = "assets/images/delete.png";
  String updateImage = "assets/images/update.png";
  String listImage = "assets/images/list.png";

  @override
  Widget build(BuildContext context) {
    var heightValue = MediaQuery.of(context).size.height;
    var widthValue = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: heightValue * 0.1, horizontal: widthValue * 0.02),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      height: 60.0,
                      image: AssetImage("assets/images/admin.png"),
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser.email,
                      style: TextStyle(
                        fontFamily: yuseiFont,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await AuthServices.getInstance().logOut();
                    Navigator.of(context).pushReplacementNamed(SplashScreen.ID);
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCard(title: addTile, image: addImage),
                CustomCard(title: updateTitle, image: updateImage),
              ],
            ),
            SizedBox(height:10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCard(title: deleteTile, image: deleteImage),
                CustomCard(title: listTitle, image: listImage),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
