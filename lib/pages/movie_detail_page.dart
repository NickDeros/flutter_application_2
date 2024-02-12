import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/movie_controller.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    String url = 'https://image.tmdb.org/t/p/original';
    final movieController = MovieController();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: movieController.getMovie(movieId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("hasdata");
            return Column(
              children: [
                Text(snapshot.data["original_title"].toString()),
                Image(
                  image: NetworkImage(url + snapshot.data!['poster_path']),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.low,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                Text(snapshot.data["vote_average"].toString()),
                // ListView.builder(
                //   itemCount: snapshot.data['production_companies'].length,
                //   itemBuilder: (context, index) {
                //     final item = snapshot.data['production_companies'];
                //     return ListTile(title: Text(item[index].toString()));
                //   },
                // )
              ],
            );
          } else if (snapshot.hasError) {
            print("hasError");
            return Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.red, fontSize: 20),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
