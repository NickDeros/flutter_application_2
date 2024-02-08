import 'package:flutter_application_2/repositories/movie_repository.dart';

class MovieController {
  Future getTrendingMovies() async {
    try {
      final movieRepo = MovieRepo();
      final movieList = await movieRepo.fetchTrending();
      if (movieList == "error") {
        throw Exception("get movie wrong");
      } else {
        return movieList;
      }
    } catch (e) {
      print("get movie catch");
      throw Exception("get movie error");
    }
  }

  Future getTopRatedMovies() async {
    try {
      final movieRepo = MovieRepo();
      final movieList = await movieRepo.fetchTopRated();
      if (movieList == "error") {
        throw Exception("get movie wrong");
      } else {
        return movieList;
      }
    } catch (e) {
      print("get movie catch");
      throw Exception("get movie error");
    }
  }
}
