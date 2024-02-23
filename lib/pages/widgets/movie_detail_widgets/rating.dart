import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.snapshot});
  final dynamic snapshot;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${snapshot.data["vote_average"]} ",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
