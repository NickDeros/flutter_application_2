import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    required int id,
    required String title,
    required bool? adult,
    required String? backdrop_path,
    required List? genre_ids,
    required String? original_language,
    required String? original_title,
    required String? overview,
    required double? popularity,
    required String? poster_path,
    required String? release_date,
    required bool? video,
    required double? vote_average,
    required int? vote_count,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, Object?> json) =>
      _$SearchModelFromJson(json);
}
