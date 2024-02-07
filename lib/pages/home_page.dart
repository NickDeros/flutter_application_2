import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
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
  Future getUser() {
    final user = FirebaseAuth.instance.currentUser!;
    final userRepo = UserRepo();
    final userData = userRepo.getUser(uid: user.uid);
    return userData;
  }

  Future getMovies() async {
    final movieRepo = MovieRepo();
    final movieList = await movieRepo.fetchAlbum();
    return movieList;
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
                  future: getMovies(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return TrendingCarousel(snapshot: snapshot);
                    } else if (snapshot.hasError) {
                      return const Text("error");
                    } else {
                      return const CircularProgressIndicator();
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
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Colors.amber,
                          height: 200,
                          width: 150,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Top rated movies",
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Colors.amber,
                          height: 200,
                          width: 150,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
