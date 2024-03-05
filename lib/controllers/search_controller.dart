import 'package:flutter_application_2/models/search_model.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  FutureOr<List<dynamic>?> build() async {
    print('sono build');
  }

  FutureOr<List<dynamic>?> searchByKeyword(keyword) async {
    List movieList = [];
    state = AsyncLoading();
    try {
      final response = await ref.read(movieRepoProvider).searchMovie(keyword);
      for (var element in response!) {
        print(element.name.toString());
        // Prendere ID Film,
        final movieResponse =
            await ref.read(movieRepoProvider).getMovie(element.id.toString());
        if (movieResponse != 'error') {
          movieList.add(movieResponse);
        }
        print('sono movie response by id');
        print(movieResponse);

        //creare ui
      }
      print('movie LIST');
      print(movieList);
      state = AsyncData(movieList);
      return movieList;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
