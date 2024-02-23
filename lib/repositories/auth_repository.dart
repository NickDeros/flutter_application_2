import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_application_2/routing/app_router.dart';

class AuthRepo {
  final goRoute = goRouter;
  final firebase = FirebaseAuth.instance;
  //Registration on FirebaseAuth
  Future registration(email, password) async {
    try {
      final credential = await firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // Login on FirebaseAuth
  Future login(email, password) async {
    try {
      final credential = await firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //Sign out from Firebase
  Future<void> signOut() async {
    await firebase.signOut();
  }

  //Auth state changes
  Stream<User?> authStateChange() {
    final state = firebase.authStateChanges();
    print(state);
    return state;
  }
}
