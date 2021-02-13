import 'package:e_commerce/Pages/Admin/AddProduct.dart';
import 'package:e_commerce/Pages/Admin/DashBoard.dart';
import 'package:e_commerce/Pages/Clients/Home.dart';
import 'package:e_commerce/Pages/Authentication/Login.dart';
import 'package:e_commerce/Pages/Authentication/Register.dart';
import 'package:e_commerce/SplashScreen.dart';
import 'package:flutter/cupertino.dart';

var route = <String,WidgetBuilder>{
  DashBoard.ID : (context) => DashBoard() ,
  Login.ID : (context) => Login(),
  Register.ID : (context) => Register() ,
  Home.ID : (context) => Home(),
  SplashScreen.ID : (context) => SplashScreen() ,
  AddProduct.ID : (context) => AddProduct() ,
};