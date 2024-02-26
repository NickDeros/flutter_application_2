import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/repositories/auth_repository.dart';

class AuthController {
  final auth = AuthRepo(FirebaseAuth.instance);
  
  Future loginController(email, password) async {
    auth.login(email, password);
  }

  Future logOut() async {
    auth.signOut();
  }
}
