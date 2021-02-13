import 'package:e_commerce/Pages/Admin/DashBoard.dart';
import 'package:e_commerce/Pages/Clients/Home.dart';
import 'package:e_commerce/Others/Constants.dart';
import 'package:e_commerce/Widgets/CustomLinkes.dart';
import 'package:e_commerce/Widgets/CustomLogo.dart';
import 'package:e_commerce/Widgets/CustomTextFormField.dart';
import 'package:e_commerce/Firebase/AuthBuilder/AuthServices.dart';
import 'package:e_commerce/Models/UserModel.dart';
import 'package:e_commerce/Provider/ModelHud.dart';
import 'package:e_commerce/Provider/UserTypeProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  static const String ID = "login";
  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email, _password;
  final String adminPassword = "admin123";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final modelHud = Provider.of<ModelHud>(context);
    final userType = Provider.of<UserTypeProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
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
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: yuseiFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    _validate(context, modelHud, userType);
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomLinks(title: "login", link: "login"),
            SizedBox(
              height: height * 0.04,
            ),

            // user type mode  >>>>>>>>>>>>>>
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Container(
                height: height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27.0),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // admin type >>>>>
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: height * 0.08,
                        width: width * 0.3,
                        child: FlatButton(
                          color: userType.isType ? Colors.white : mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          child: Text(
                            "Admin",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: yuseiFont,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            userType.changeIsTYpe(true);
                          },
                        ),
                      ),
                    ),

                    // user type >>>>>>
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: height * 0.08,
                        width: width * 0.3,
                        child: FlatButton(
                          color: userType.isType ? mainColor : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          child: Text(
                            "User",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: yuseiFont,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            userType.changeIsTYpe(false);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _validate(BuildContext context, ModelHud modelHud,UserTypeProvider userType) async {
    modelHud.changeLoading(true);
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (userType.isType) {
        if (_password == adminPassword) {
          try {
            UserModel user = UserModel(_email, _password);
            var result = await AuthServices.getInstance().login(user);
            if (result == true) {
              modelHud.changeLoading(false);
              Navigator.of(context).pushReplacementNamed(DashBoard.ID);
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == "invalid-email") {
              modelHud.changeLoading(false);
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text("email is invalid"),
                ),
              );
            }
            if (e.code == "wrong-password") {
              modelHud.changeLoading(false);
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text("this password is wrong"),
                ),
              );
            }
            if (e.code == "user-not-found") {
              modelHud.changeLoading(false);
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text("user not found"),
                ),
              );
            }
          } catch (e) {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text("there is problem in interint")),
            );
          }
        } else {
          modelHud.changeLoading(false);
          _scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text("email or password is wrong")));
        }
      } else {
        try {
          UserModel user = UserModel(_email, _password);
          var result = await AuthServices.getInstance().login(user);
          if (result == true) {
            modelHud.changeLoading(false);
            Navigator.of(context).pushReplacementNamed(Home.ID);
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "invalid-email") {
            modelHud.changeLoading(false);
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("email is invalid"),
              ),
            );
          }
          if (e.code == "wrong-password") {
            modelHud.changeLoading(false);
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("this password is wrong"),
              ),
            );
          }
          if (e.code == "user-not-found") {
            modelHud.changeLoading(false);
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("user not found"),
              ),
            );
          }
        } catch (e) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text("there is problem in interint")),
          );
        }
      }
    } else {
      modelHud.changeLoading(false);
    }
  }
}
