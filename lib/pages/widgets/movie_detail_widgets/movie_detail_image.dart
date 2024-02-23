import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MovieDetailImage extends StatelessWidget {
  const MovieDetailImage({super.key, required this.url, required this.snapshot});
  final dynamic url;
  final dynamic snapshot;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url + snapshot.data!['backdrop_path'],
        filterQuality: FilterQuality.low,
        height: 300,
        width: 380,
        fit: BoxFit.cover,
      ),
    );
  }
}
