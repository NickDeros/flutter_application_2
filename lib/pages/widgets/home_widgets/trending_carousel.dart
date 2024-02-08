import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/forgot_password_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/movie_detail_page.dart';

class TrendingCarousel extends StatelessWidget {
  const TrendingCarousel({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;


  @override
  Widget build(BuildContext context) {
    String url = 'https://image.tmdb.org/t/p/original';
    return CarouselSlider.builder(
      itemCount: snapshot.data.length,
      options: CarouselOptions(
        height: 300,
        aspectRatio: 16 / 9,
        autoPlay: true,
        viewportFraction: 0.55,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        pageSnapping: true,
      ),
      itemBuilder: (context, itemIndex, pageViewIndex) {
        int movieId = snapshot.data![itemIndex]['id'];
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  MovieDetailPage(movieId: movieId),
                    ),
                  );
                },
                child: Image(
                  image: NetworkImage(
                      url + snapshot.data![itemIndex]['poster_path']),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.low,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: Text(
                  snapshot.data![itemIndex]["title"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
