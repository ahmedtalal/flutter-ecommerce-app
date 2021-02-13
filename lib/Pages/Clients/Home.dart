import 'package:e_commerce/SplashScreen.dart';
import 'package:e_commerce/Firebase/AuthBuilder/AuthServices.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String ID = "home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthServices.getInstance().logOut();
              Navigator.of(context).pushReplacementNamed(SplashScreen.ID);
            },
          ),
        ],
      ),
    );
  }
}
