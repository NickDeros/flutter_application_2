import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerOnYT extends StatelessWidget {
  const TrailerOnYT({super.key, required this.movieVideos});
  final dynamic movieVideos;

  @override
  Widget build(BuildContext context) {
    return 
    movieVideos.length == 0
        ? const Text("no trailer")
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              YoutubePlayerController controller = YoutubePlayerController(
                initialVideoId: movieVideos[index]['key'],
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              );
              return YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
              );
            },
          );
  }
}
