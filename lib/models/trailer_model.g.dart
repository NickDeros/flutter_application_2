// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrailerModelImpl _$$TrailerModelImplFromJson(Map<String, dynamic> json) =>
    _$TrailerModelImpl(
      iso_639_1: json['iso_639_1'] as String,
      iso_3166_1: json['iso_3166_1'] as String,
      name: json['name'] as String,
      key: json['key'] as String,
      site: json['site'] as String,
      size: json['size'] as int,
      type: json['type'] as String,
      official: json['official'] as bool,
      published_at: json['published_at'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$TrailerModelImplToJson(_$TrailerModelImpl instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.published_at,
      'id': instance.id,
    };
