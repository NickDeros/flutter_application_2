import 'package:flutter_application_2/repositories/auth_repository.dart';

class AuthController {
  final auth = AuthRepo();
  
  Future loginController(email, password) async {
    auth.login(email, password);
  }
}
