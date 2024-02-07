import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieRepo {
  String url = 'https://api.themoviedb.org/3';
  String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Njk1NjU2MjkzYTZkY2VmYmZlNjZjNjQ0NDlkNjU4MCIsInN1YiI6IjY1YzM0MDNlY2I3NWQxMDEzMDZiYzBmZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NBiMsIPFZyRzQ70Y8xDedrf42ghL7GmUsaFe3ckQT34';

  Future fetchAlbum() async {
    try {
      final response =
          await http.get(Uri.parse('$url/movie/popular'), headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200){
        print("Success");
        final data = jsonDecode(response.body);
        return data['results'] as List;
      } else {
        print ("Error 401");
        return 'error';
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
