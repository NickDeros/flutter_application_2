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
      // for (var element in response!) {
      //   print(element.title.toString());
      //   // Prendere ID Film,
      //   final movieResponse =
      //       await ref.read(movieRepoProvider).getMovie(element.id.toString());
      //   print('POSTER PATH');
      //   //print(movieResponse['poster_path']);
      //   if (movieResponse != 'error') {
      //   //if (movieResponse != 'error' || movieResponse['poster_path'] != null) {
      //     movieList.add(movieResponse);
      //   }
      //   print('sono movie response by id');
      //   print(movieResponse);

      //   //creare ui
      // }
      state = AsyncData(response);
      return response;
      // state = AsyncData(movieList);
      // return movieList;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      print(e.toString());
    }
  }
}
