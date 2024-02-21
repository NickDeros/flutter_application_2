import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/movie_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
            final productionCompanies = snapshot.data['production_companies'];
            final movieVideos = snapshot.data["results"];
            if (kDebugMode) {
              print('----');
              print(snapshot.data['results']);
              print(productionCompanies.toString());
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
                    const SizedBox(height: 5),
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
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 90),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          label: Text(
                            'Play Now',
                            style: GoogleFonts.roboto(
                              fontSize: 25,
                            ),
                          ),
                          icon: const Icon(Icons.play_arrow_rounded),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 90),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      label: Text(
                        'Download',
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                        ),
                      ),
                      icon: const Icon(Icons.file_download_outlined),
                    ),
                    const SizedBox(height: 25),
                    ReadMoreText(snapshot.data['overview'].toString(),
                        style: GoogleFonts.aBeeZee(fontSize: 16),
                        trimLines: 2,
                        colorClickableText: Colors.deepPurple,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: const TextStyle(
                            fontSize: 16.5, color: Colors.deepPurpleAccent)),
                    const SizedBox(height: 20),
                    // ListView.builder(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   itemCount: productionCompanies.length,
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       title: Text(productionCompanies[1]['name'],
                    //           style: Theme.of(context).textTheme.titleMedium),
                    //     );
                    //   },
                    // ),
                    Text(
                      "Trailer on Youtube",
                      style: GoogleFonts.aBeeZee(fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    movieVideos.length == 0
                        ? const Text("no trailer")
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              YoutubePlayerController controller =
                                  YoutubePlayerController(
                                initialVideoId: movieVideos[0]['key'],
                                flags: const YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                ),
                              );
                              return YoutubePlayer(
                                controller: controller,
                                showVideoProgressIndicator: true,
                              );
                            },
                          ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            if (kDebugMode) {
              print("hasError");
            }
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
