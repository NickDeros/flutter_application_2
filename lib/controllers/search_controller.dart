import 'dart:ffi';

import 'package:flutter_application_2/models/search_model.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  FutureOr<List<SearchModel>?> build() async {
    print('sono build');
  }

  FutureOr<List<SearchModel>?> searchByKeyword(keyword) async {
    List movieList = [];
    state = AsyncLoading();
    try {
      final response = await ref.read(movieRepoProvider).searchMovie(keyword);
      print('SONO RESPONSE IN CONTROLLER');
      print(response);
      state = AsyncData(response);
      return response;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      print(e.toString());
    }
  }
}

@riverpod
class SaveKeyword extends _$SaveKeyword {
  @override
  String build() {
    return '';
  }

  void updateKeyword(String keyword) {
      state = keyword;
  }
}
