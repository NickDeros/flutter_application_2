
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class Overview extends StatelessWidget {
  const Overview({super.key, required this.snapshot, required this.productionCompanies});
  final AsyncSnapshot snapshot;
  final dynamic productionCompanies;
  
  @override
  Widget build(BuildContext context) {
    return 
        ReadMoreText(
          snapshot.data['overview'].toString(),
          style: GoogleFonts.aBeeZee(fontSize: 16),
          trimLines: 2,
          colorClickableText: Colors.deepPurple,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: ' Show less',
          moreStyle:
              const TextStyle(fontSize: 16.5, color: Colors.deepPurpleAccent),
        );
  }
}
