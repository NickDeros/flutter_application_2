import 'package:flutter_application_2/repositories/movie_repository.dart';

class MovieController {
  final movieRepo = MovieRepo();

  Future getTrendingMovies() async {
    try {
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

  Future getMoviesInTheatres() async {
    try {
      final movieList = await movieRepo.fetchMoviesInTheatres();
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

  Future getMovie(movieId) async {
    try {
      final movieDetail = await movieRepo.getMovie(movieId);
      if (movieDetail == "error") {
        throw Exception("get movie wrong");
      } else {
        return movieDetail;
      }
    } catch (e) {
      print('controller movie');
      print(e.toString());
      throw Exception("get movie error");
    }
  }

  Future getMovieAndVideos(movieId) async {
    try {
      final movieDetail = await movieRepo.getMovie(movieId);
      final movieVideos = await movieRepo.getVideos(movieId);
      if (movieDetail == "error" && movieVideos == "error") {
        print('get movies and video IF');
        throw Exception("get movie wrong");
      } else {
        movieDetail.addAll({'results': movieVideos});
        print('get movies and video else');
        print(movieDetail);
        print(movieVideos);
        print('sono detail+videos');
        print(movieDetail);
        return movieDetail;
      }
    } catch (e) {
      print('controller movie');
      print(e.toString());
      throw Exception(e);
    }
  }
}
