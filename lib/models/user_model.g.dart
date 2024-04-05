// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
      registration_date: json['registration_date'] as String,
      uid: json['uid'] as String,
      role: json['role'] as String? ?? 'default',
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'age': instance.age,
      'registration_date': instance.registration_date,
      'uid': instance.uid,
      'role': instance.role,
      'imgUrl': instance.imgUrl,
    };
