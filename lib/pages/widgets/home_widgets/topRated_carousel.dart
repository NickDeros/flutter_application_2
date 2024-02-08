import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopRatedCarousel extends StatelessWidget {
  const TopRatedCarousel({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    String url = 'https://image.tmdb.org/t/p/original';
    return CarouselSlider.builder(
      itemCount: snapshot.data.length,
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        autoPlay: false,
        viewportFraction: 0.42,
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
      ),
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image(
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
