import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.local_play,
          size: 100,
        ),
        const SizedBox(height: 25),

        //Hello Again

        Text(
          'Hello Again!',
          style: GoogleFonts.bebasNeue(
            fontSize: 52,
          ),
        ),
      ],
    );
  }
}
