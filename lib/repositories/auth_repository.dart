import 'package:firebase_auth/firebase_auth.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository.g.dart';

class AuthRepo {
  const AuthRepo(this.firebase);
  final FirebaseAuth firebase;

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
    final user = firebase.authStateChanges();
    return user;
  }

  Future<User?> getCurrentUser() async {
    final currentUser = await FirebaseAuth.instance.currentUser!;
    return currentUser;
  }

  Future<void> updateUserEmail(
    email,
  ) async {
    final user = await getCurrentUser();
    user?.updateEmail(email);
  }

  Future<void> updateUserPassword(
    newPassword,
  ) async {
    final user = await getCurrentUser();
    user?.updatePassword(newPassword);
  }
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
AuthRepo authRepo(AuthRepoRef ref) {
  return AuthRepo(ref.watch(firebaseAuthProvider));
}

@riverpod
Stream authStateChange(AuthStateChangeRef ref) {
  return ref.watch(authRepoProvider).authStateChange();
}

@riverpod
Future<String?> uid(UidRef ref) async {
  final user = await ref.watch(authRepoProvider).getCurrentUser();
  return user!.uid;
}
