import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/user_model.dart';

class UserRepo {
  
  var db = FirebaseFirestore.instance;
  
  // Add User to Firestore
  Future<void> addUser({required UserModel user}) async {
    await db.collection('users').doc(user.uid).set(
      user.toJson()
    );
  }
  
  //Get all User fields from Firestore
  Future<Map<String, dynamic>> getUser({required uid}) async {
   var snapshot = await db.collection('users').doc(uid).get();
   Map<String, dynamic>? query = snapshot.data();
   return query!;
  }

  
}