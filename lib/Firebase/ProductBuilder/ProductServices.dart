import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Firebase/FirebaseModel/FirebaseModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductServices implements FirebaseModel {
  @override
  Future<bool> addData(model) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> convertModelToMap(model, String id) {
    throw UnimplementedError();
  }

  @override
  bool deleteData(String id) {
    throw UnimplementedError();
  }

  @override
  User getUser() {
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot> selectData() {
    throw UnimplementedError();
  }

  @override
  bool updateData(model) {
    throw UnimplementedError();
  }

}