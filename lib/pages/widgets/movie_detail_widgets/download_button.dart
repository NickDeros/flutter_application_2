
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 90),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      label: Text(
        'Download',
        style: GoogleFonts.roboto(
          fontSize: 25,
        ),
      ),
      icon: const Icon(Icons.file_download_outlined),
    );
  }
}
