import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingCarousel extends StatelessWidget {
  const TrendingCarousel({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: snapshot.data.length,
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        viewportFraction: 0.55,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        pageSnapping: true,
      ),
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 300,
            width: 200,
            color: Colors.amber,
            child: Text(snapshot.data![itemIndex]["title"]),
          ),
        );
      },
    );
  }
}
