// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchModelImpl _$$SearchModelImplFromJson(Map<String, dynamic> json) =>
    _$SearchModelImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      adult: json['adult'] as bool?,
      backdrop_path: json['backdrop_path'] as String?,
      genre_ids: json['genre_ids'] as List<dynamic>?,
      original_language: json['original_language'] as String?,
      original_title: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      poster_path: json['poster_path'] as String?,
      release_date: json['release_date'] as String?,
      video: json['video'] as bool?,
      vote_average: (json['vote_average'] as num?)?.toDouble(),
      vote_count: json['vote_count'] as int?,
    );

Map<String, dynamic> _$$SearchModelImplToJson(_$SearchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'genre_ids': instance.genre_ids,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
