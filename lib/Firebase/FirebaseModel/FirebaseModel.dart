import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseModel {
  Future<bool>addData(var model);
  Stream<QuerySnapshot> selectData() ;
  bool updateData(var model) ;
  bool deleteData(String id) ;
  Map<String,dynamic> convertModelToMap(var model,String id) ;
  User getUser();

}