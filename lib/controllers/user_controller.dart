import 'package:flutter_application_2/repositories/auth_repository.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  void build() {}

  Future<Map<String, dynamic>> getUserController(uid) async {
    final authRepo = ref.read(authRepoProvider);

    final userAuth = await authRepo.getCurrentUser();

    return userAuth;
  }
}

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<Map<String, dynamic>> build(uid) async {
    final userRepo = ref.read(userRepoProvider);

    try {
      AsyncLoading();
      final userProfile = await userRepo.getUser(uid: uid);
      AsyncData(userProfile);
      return userProfile;
    } catch (e) {
      AsyncError(e, StackTrace.current);
    }
    throw 'null';
  }
}
