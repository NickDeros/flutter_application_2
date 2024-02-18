import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/movie_controller.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    String url = 'https://image.tmdb.org/t/p/original';
    final movieController = MovieController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 42, 42),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
      ),
      body: FutureBuilder(
        future: movieController.getMovie(movieId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final item = snapshot.data['production_companies'];
            print(item.toString());
            print("hasdata");
            print(snapshot.data['production_companies'].length);
            return Column(
              children: [
                Text(snapshot.data["title"].toString(),
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 34,
                    )),
                Row(
                  children: [
                    ClipRRect(
                      child: Image.network(url + snapshot.data!['poster_path'],
                      filterQuality: FilterQuality.low,
                      alignment: Alignment.topLeft,
                      height: 400,
                      width: 200,
                      ),
                    ),
                    Text("Original Title")
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data["vote_average"].toString(),
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                // ListView.builder(
                //   itemCount: snapshot.data['production_companies'].length,
                //   itemBuilder: (context, index) {
                //     String key = snapshot.data['production_companies'].toList();
                //     return ListTile(title: Text(key[index]));
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
