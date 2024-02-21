import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieRepo {
  String url = 'https://api.themoviedb.org/3';
  String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Njk1NjU2MjkzYTZkY2VmYmZlNjZjNjQ0NDlkNjU4MCIsInN1YiI6IjY1YzM0MDNlY2I3NWQxMDEzMDZiYzBmZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NBiMsIPFZyRzQ70Y8xDedrf42ghL7GmUsaFe3ckQT34';

  Future fetchTrending() async {
    try {
      final response =
          await http.get(Uri.parse('$url/movie/popular'), headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print("Success");
        final data = jsonDecode(response.body);
        return data['results'] as List;
      } else {
        print("Error 401");
        // throw Exception('Access Denied!');
        return "error";
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future fetchTopRated() async {
    try {
      final response =
          await http.get(Uri.parse('$url/movie/top_rated'), headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print("Success");
        final data = jsonDecode(response.body);
        return data['results'] as List;
      } else {
        print("Error 401");
        // throw Exception('Access Denied!');
        return "error";
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

    Future fetchMoviesInTheatres() async {
    try {
      final response =
          await http.get(Uri.parse('$url/movie/now_playing'), headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print("Success");
        final data = jsonDecode(response.body);
        return data['results'] as List;
      } else {
        print("Error 401");
        // throw Exception('Access Denied!');
        return "error";
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future getMovie(movieId) async {
    try {
      final response =
          await http.get(Uri.parse('$url/movie/$movieId'), headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print("get movie");
        print("Success");
        final data = jsonDecode(response.body);
        return data;
      } else {
        print("Error get movie");
        print("Error 401");
        // throw Exception('Access Denied!');
        return "error";
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future getVideos(movieId) async {
    try {
      final response =
          await http.get(Uri.parse('$url/movie/$movieId/videos'), headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print("get videos");
        print("Success");
        final data = jsonDecode(response.body);
        return data;
      } else {
        print("Error get videos");
        print("Error 401");
        // throw Exception('Access Denied!');
        return "error";
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
