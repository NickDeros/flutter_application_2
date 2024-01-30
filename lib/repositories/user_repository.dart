import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/user_model.dart';

class UserRepo {
  
  var db = FirebaseFirestore.instance;

  Future<void> addUser(
    String firstName,
    String lastName,
    String email,
    int? age,
    String regDate,
    String uid,
  ) async {
    await db.collection('users').doc(uid).set({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'age': age,
      'registration_date': regDate,
      'uid': uid,
      'role': "user",
    });
  }
  

  Future<UserModel> getUser({required uid}) async {
   var snapshot = await db.collection('users').doc(uid).get();
   Map<String, dynamic>? query = snapshot.data();
   var query2 = UserModel.fromMap(query!);
   return UserModel.fromMap(query);
  }

}