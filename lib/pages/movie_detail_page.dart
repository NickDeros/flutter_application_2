import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/controllers/movie_controller.dart';
import 'package:flutter_application_2/pages/widgets/movie_detail_widgets/download_button.dart';
import 'package:flutter_application_2/pages/widgets/movie_detail_widgets/movie_detail_image.dart';
import 'package:flutter_application_2/pages/widgets/movie_detail_widgets/overview.dart';
import 'package:flutter_application_2/pages/widgets/movie_detail_widgets/play_button.dart';
import 'package:flutter_application_2/pages/widgets/movie_detail_widgets/rating.dart';
import 'package:flutter_application_2/pages/widgets/movie_detail_widgets/trailer_on_YT.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
        future: movieController.getMovieAndVideos(widget.movieId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final productionCompanies = snapshot.data['production_companies'];
            final movieVideos = snapshot.data['results'];
            if (kDebugMode) {
              print(movieVideos);
              print('----');
              print(snapshot.data);
              print(productionCompanies.toString());
              print("movie detail data");
              print(snapshot.data['production_companies'].length);
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data["title"].toString(),
                          style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                          alignment: Alignment.centerRight,
                          iconSize: 40,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    //MOVIE IMAGE
                    MovieDetailImage(url: url, snapshot: snapshot),
                    const SizedBox(height: 5),
                    //RATING
                    Rating(snapshot: snapshot),
                    const SizedBox(height: 10),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PlayButton(),
                        SizedBox(height: 12),
                        DownloadButton(),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // OVERVIEW
                    Overview(
                        snapshot: snapshot,
                        productionCompanies: productionCompanies),
                    const SizedBox(height: 20),
                    Text(
                      "Trailer on Youtube",
                      style: GoogleFonts.aBeeZee(fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    TrailerOnYT(movieVideos: movieVideos),
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

        // ListView.builder(
        //               physics: const NeverScrollableScrollPhysics(),
        //               shrinkWrap: true,
        //               itemCount: productionCompanies.length,
        //               itemBuilder: (context, index) {
        //                 return ListTile(
        //                   title: Text(productionCompanies[1]['name'],
        //                       style: Theme.of(context).textTheme.titleMedium),
        //                 );
        //               },
        //             )
      