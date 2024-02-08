import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_2/controllers/movie_controller.dart";
import "package:flutter_application_2/pages/movie_detail_page.dart";
import "package:flutter_application_2/pages/widgets/home_widgets/topRated_carousel.dart";
import "package:flutter_application_2/pages/widgets/home_widgets/trending_carousel.dart";
import "package:flutter_application_2/repositories/movie_repository.dart";
import "package:flutter_application_2/repositories/user_repository.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final movieController = MovieController();
  Future getUser() {
    final user = FirebaseAuth.instance.currentUser!;
    final userRepo = UserRepo();
    final userData = userRepo.getUser(uid: user.uid);
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 42, 42),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.account_circle_rounded,
          color: Colors.white,
          size: 50,
        ),
        title: FutureBuilder(
          future: getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text(
                "Hi ${snapshot.data["first_name"]}!",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        actions: [
          // ICON SEARCH
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 40, color: Colors.white),
          ),
        ],
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
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
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
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              // TOP RATED MOVIES
              const SizedBox(
                height: 16,
              ),
              Text(
                "Top rated movies",
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 32),
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
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Text(
                "Top rated movies",
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
