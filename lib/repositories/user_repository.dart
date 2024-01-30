import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepo {
  
  var db = FirebaseFirestore.instance;

  Future<void> addUser(
    String firstName,
    String lastName,
    String email,
    int age,
    String regDate,
    String uid,
  ) async {
    await db.collection('users').doc(uid).set({
      'first name:': firstName,
      'last name:': lastName,
      'email:': email,
      'age:': age,
      'registration date': regDate,
      'uid': uid,
      'role': "user",
    });
  }
  
}