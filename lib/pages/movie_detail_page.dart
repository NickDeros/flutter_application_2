import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/movie_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.movieId});
  final int movieId;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
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
        future: movieController.getMovieAndVideos(widget.movieId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final production_companies = snapshot.data['production_companies'];
            if (kDebugMode) {
              print('----');
              print(snapshot.data['results']);
              print(production_companies.toString());
              print("movie detail data");
              print(snapshot.data['production_companies'].length);
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      snapshot.data["title"].toString(),
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        url + snapshot.data!['backdrop_path'],
                        filterQuality: FilterQuality.low,
                        height: 300,
                        width: 380,
                        fit: BoxFit.cover,
                      ),
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
                    const SizedBox(height: 20),
                    Text(
                      snapshot.data['overview'].toString(),
                      style: GoogleFonts.aBeeZee(fontSize: 16.5),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: production_companies.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(production_companies[index]['name'],
                              style: Theme.of(context).textTheme.titleMedium),
                        );
                      },
                    )
                  ],
                ),
              ),
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
