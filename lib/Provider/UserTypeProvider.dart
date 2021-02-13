import 'package:flutter/cupertino.dart';

class UserTypeProvider extends ChangeNotifier {
  bool isType = false ;

  changeIsTYpe(bool value) {
    isType = value ;
    notifyListeners() ;
  }
}