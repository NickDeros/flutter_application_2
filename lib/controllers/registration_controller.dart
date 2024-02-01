import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';

class RegistrationController {

  Future<void> signUp({
    required String email,
    required String password,
    required String first_name,
    required String last_name,
    required int age,
    required String confirmPassword
  }) async {
    // create user
    if (passwordConfirmed(password: password, confirmPassword: confirmPassword )) {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (kDebugMode) {
        // ignore: prefer_interpolation_to_compose_strings
        print("CIAO SONO USER DATA");
        print(user.user!.uid);
      }

      final uid = user.user!.uid;

      UserModel userModel = UserModel(
        first_name: first_name.trim(),
        last_name: last_name.trim(),
        email: email.trim(),
        age: age,
        registration_date: DateTime.now().toString(),
        uid: uid,
      );

      // add user details in database
      final userRepo = UserRepo();
      userRepo.addUser(
        user: userModel,
      );
    }
  }

  bool passwordConfirmed({required String password, required String confirmPassword}) {
    if (password.trim() ==
        confirmPassword.trim()) {
      return true;
    } else {
      return false;
    }
  }
}
