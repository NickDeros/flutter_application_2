import "package:flutter/material.dart";
import "package:flutter_application_2/controllers/movie_controller.dart";
import "package:flutter_application_2/pages/widgets/home_widgets/customAppbar.dart";
import "package:flutter_application_2/pages/widgets/home_widgets/topRated_carousel.dart";
import "package:flutter_application_2/pages/widgets/home_widgets/trending_carousel.dart";
import "package:flutter_application_2/utils/drawer.dart";
import "package:google_fonts/google_fonts.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final movieController = MovieController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const CustomAppBar(),
        drawer: const Drawer(
          child: MyDrawer(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TRENDING MOVIES
                Text(
                  'Trending Movies',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FutureBuilder(
                    future: movieController.getTrendingMovies(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print("hasdata");
                        return TrendingCarousel(snapshot: snapshot);
                      } else if (snapshot.hasError) {
                        print("hasError");
                        return Text(
                          snapshot.error.toString(),
                          style:
                              const TextStyle(color: Colors.red, fontSize: 20),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                // TOP RATED MOVIES
                const SizedBox(height: 20),
                Text(
                  "Top rated movies",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FutureBuilder(
                    future: movieController.getTopRatedMovies(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print("hasdata");
                        return TopRatedCarousel(snapshot: snapshot);
                      } else if (snapshot.hasError) {
                        print("hasError");
                        return Text(
                          snapshot.error.toString(),
                          style:
                              const TextStyle(color: Colors.red, fontSize: 20),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),

                //Movies In Theatres
                const SizedBox(height: 20),
                Text(
                  "Now in theatres",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FutureBuilder(
                    future: movieController.getMoviesInTheatres(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print("hasdata");
                        return TopRatedCarousel(snapshot: snapshot);
                      } else if (snapshot.hasError) {
                        print("hasError");
                        return Text(
                          snapshot.error.toString(),
                          style:
                              const TextStyle(color: Colors.red, fontSize: 20),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                //Coming Soon
                const SizedBox(height: 20),
                Text(
                  "Coming Soon",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FutureBuilder(
                    future: movieController.comingSoon(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print("hasdata");
                        return TopRatedCarousel(snapshot: snapshot);
                      } else if (snapshot.hasError) {
                        print("hasError");
                        return Text(
                          snapshot.error.toString(),
                          style:
                              const TextStyle(color: Colors.red, fontSize: 20),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
