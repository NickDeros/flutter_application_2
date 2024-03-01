import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/repositories/auth_repository.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<User?> build() async {
    try {
      state = AsyncLoading();
      final authRepo = ref.read(authRepoProvider);
      final userAuth = await authRepo.getCurrentUser();
      state = AsyncData(userAuth);
      return userAuth;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<Map<String, dynamic>> build(uid) async {
    final userRepo = ref.read(userRepoProvider);

    try {
      state = AsyncLoading();
      final userProfile = await userRepo.getUser(uid: uid);
      state = AsyncData(userProfile);
      return userProfile;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
    throw 'null';
  }
}

@riverpod
class UserUpdate extends _$UserUpdate {
  @override
  FutureOr<Map<String, dynamic>> build(uid) async {
    final user = await getUser(uid);
    return user;
  }

  FutureOr<Map<String, dynamic>> getUser(uid) async {
    final userRepo = ref.read(userRepoProvider);

    state = AsyncLoading();
    final userProfile = await userRepo.getUser(uid: uid);
    state = AsyncData(userProfile);
    return userProfile;
  }

  FutureOr<void> userEdit(
    email,
    password,
    age,
    first_name,
    last_name,
    uid,
  ) async {
    state = AsyncLoading();

    UserModel userModel = UserModel(
      first_name: first_name.trim(),
      last_name: last_name.trim(),
      email: email.trim(),
      age: age,
      registration_date: DateTime.now().toString(),
      uid: uid,
    );

    try {
      debugPrint('user controller');
      debugPrint(userModel.toString());
      final userRepo = ref.read(userRepoProvider);
      //modificare nel database firestore
      final userUpdated = await userRepo.editUser(user: userModel);
      //modificare email e password auth
      // state = AsyncData();
      ref.invalidateSelf();
      await future;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
