import 'package:e_commerce/Firebase/AuthBuilder/AuthCrudServices.dart';
import 'package:e_commerce/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static AuthServices _authBuilder;
  FirebaseAuth _auth = FirebaseAuth.instance;

  // is used to get only one instance form this class >>>>>>
  static AuthServices getInstance() {
    if (_authBuilder == null) {
      return _authBuilder = AuthServices();
    }
    return _authBuilder;
  }

  Future<bool> register(UserModel user) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
    if (credential != null) {
      print("the result is $credential");
      return await AuthCrudServices.getInstance().addData(user);
    }
    return false;
  }

  Future<bool> login(UserModel user) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
    if (credential != null) {
      return true;
    }
    return false;
  }

  Future<void> logOut() async {
    await _auth.signOut() ;
  }

  Future<bool> checkUserAuth() async{
    User user = _auth.currentUser;
    if(user != null){
      IdTokenResult idTokenResult= await user.getIdTokenResult(true);
      return idTokenResult.token != null ;
    }else {
      return false ;
    }
  }

}
