

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'user_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
  required String first_name,
  required String last_name,
  required String email,
  required int age,
  required String registration_date,
  required String uid,
  @Default('default') String? role,
  String? imgUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json)
      => _$UserModelFromJson(json);
}