import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerDemo extends StatelessWidget {
  
final String _videoId;
late final YoutubePlayerController _controller;

YoutubePlayerDemo(this._videoId) {
  _controller = YoutubePlayerController.fromVideoId(
    videoId: _videoId,
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );
}


  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
    controller: _controller,
    aspectRatio: 16 / 9,
    );
  }
}

