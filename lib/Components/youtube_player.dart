import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerDemo extends StatelessWidget {
  final videoId = "BJhF0L7pfo8";
  

// If the requirement is just to play a single video.
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: "BJhF0L7pfo8",
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );


  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      aspectRatio: 16 / 9,
    );
  }
}