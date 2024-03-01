import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepo {
  const UserRepo(this.firestore);
  final FirebaseFirestore firestore;

  // Add User to Firestore
  Future<void> addUser({required UserModel user}) async {
    await firestore.collection('users').doc(user.uid).set(user.toJson());
  }

  Future<void> editUser({required UserModel user}) async {
    print('user repoooo');
    print(user);
    await firestore.collection('users').doc(user.uid).set(user.toJson());
  }

  //Get all User fields from Firestore
  Future<Map<String, dynamic>> getUser({required uid}) async {
    final snapshot = await firestore.collection('users').doc(uid).get();
    Map<String, dynamic>? query = snapshot.data();
    return query!;
  }
}

@Riverpod(keepAlive: true)
FirebaseFirestore firestore(FirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@Riverpod(keepAlive: true)
UserRepo userRepo(UserRepoRef ref) {
  return UserRepo(ref.watch(firestoreProvider));
}
