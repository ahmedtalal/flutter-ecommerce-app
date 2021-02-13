import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Firebase/FirebaseModel/FirebaseModel.dart';
import 'package:e_commerce/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCrudServices implements FirebaseModel {
  static AuthCrudServices _builder;

// this method is used to create only one instance from AuthCrudServices class >>>>
  static AuthCrudServices getInstance() {
    if (_builder == null) {
      return _builder = AuthCrudServices();
    }
    return _builder;
  }

  @override
  Future<bool> addData(model) async {
    bool result = false ;
    String userId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("Users");
    DocumentReference docRef = collRef.doc(userId);
    Map<String, dynamic> data = convertModelToMap(model, userId);
    await docRef.set(data).whenComplete(() {
      print("add data true");
      result = true ;
    }).catchError((onError) => print("add user error is $onError"));
    return result;
  }

  @override
  bool deleteData(String id) {
    bool result = false ;
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("Users");
    DocumentReference docRef = collRef.doc(id);
    docRef.delete().whenComplete(() {
      result = true ;
    }).catchError((onError) => print("delete user error is $onError"));
    return result;
  }

  @override
  Stream<QuerySnapshot> selectData() {
    String userId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("Users");
    DocumentReference docRef = collRef.doc(userId);
    docRef.snapshots().listen((DocumentSnapshot snapshot) {
      return snapshot;
    }).onError((handleError) => print("get user data error is $handleError"));
    return null;
  }

  @override
  bool updateData(model) {
    bool result = false ;
    String userId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("Users");
    DocumentReference docRef = collRef.doc(userId);
    Map<String, dynamic> data = convertModelToMap(model, userId);
    docRef.update(data).whenComplete(() {
      result = true;
    }).catchError((onError) => print("update user error is $onError"));
    return result;
  }

  @override
  Map<String, dynamic> convertModelToMap(model, String id) {
    UserModel user = model as UserModel;
    UserModel userMap = UserModel.allWithId(user.name, user.email, id);
    return userMap.toMap();
  }

  @override
  User getUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
