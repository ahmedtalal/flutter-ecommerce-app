import 'package:e_commerce/Pages/Clients/Home.dart';
import 'package:e_commerce/Others/Constants.dart';
import 'package:e_commerce/Widgets/CustomLinkes.dart';
import 'package:e_commerce/Widgets/CustomLogo.dart';
import 'package:e_commerce/Widgets/CustomTextFormField.dart';
import 'package:e_commerce/Firebase/AuthBuilder/AuthServices.dart';
import 'package:e_commerce/Models/UserModel.dart';
import 'package:e_commerce/Provider/ModelHud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  static const String ID = "register";
  var _formKey = GlobalKey<FormState>();
  var _scafolldKey = GlobalKey<ScaffoldState>();
  String _name, _email, _password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final modelHud = Provider.of<ModelHud>(context);
    return Scaffold(
      key: _scafolldKey,
      backgroundColor: mainColor,
      body: ModalProgressHUD(
        inAsyncCall: modelHud.isLoading,
        child: ListView(
          children: [
            CustomLogo(),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // email text form field >>>>>
                  CustomTextFormField(
                    hint: "name",
                    iconData: Icons.person,
                    onClick: (value) {
                      _name = value;
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(
                    hint: "email",
                    iconData: Icons.email,
                    onClick: (value) {
                      _email = value;
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(
                    hint: "password",
                    iconData: Icons.lock,
                    onClick: (value) {
                      _password = value;
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.23),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: yuseiFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: (){
                    _validRegister(context, modelHud);
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomLinks(title: "register", link: "register"),
          ],
        ),
      ),
    );
  }
  
  // register validation method >>>>>>>>>>>
  void _validRegister(BuildContext context, ModelHud modelHud) async {
    modelHud.changeLoading(true);
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      UserModel user = UserModel.nameEmailPass(_name, _email, _password);
      try {
        bool result = await AuthServices.getInstance().register(user);
        if (result == true) {
          modelHud.changeLoading(false) ;
          Navigator.of(context).pushReplacementNamed(Home.ID);
        } else {
          modelHud.changeLoading(false);
          _scafolldKey.currentState.showSnackBar(
            SnackBar(content: Text("there is error")),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-is-use") {
          modelHud.changeLoading(false);
          _scafolldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("email already is used"),
            ),
          );
        }
        if (e.code == "invalid-email") {
          modelHud.changeLoading(false);
          _scafolldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("email is invalid"),
            ),
          );
          if (e.code == "weak-password") {
            modelHud.changeLoading(false);
            _scafolldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("password is weak"),
              ),
            );
          }
        }
      } catch (e) {
        modelHud.changeLoading(false);
        _scafolldKey.currentState.showSnackBar(
          SnackBar(
            content: Text("there is problem in internet"),
          ),
        );
      }
    } else {
      modelHud.changeLoading(false);
    }
  }
}
