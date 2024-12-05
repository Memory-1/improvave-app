import 'package:flutter/material.dart';
import 'package:namer_app/components/youtube_player.dart';

class TestPage extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      body: Center(
        child: YoutubePlayerDemo("BJhF0L7pfo8")
      ),
    );
  }
}