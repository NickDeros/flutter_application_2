import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/movie_controller.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final movieController = MovieController();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: movieController.getMovie(movieId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("hasdata");
            return Text(snapshot.data["id"].toString());
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
