import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';
import '../components/game.dart';
import 'details_page.dart';
import '../components/tag_container.dart';

class FutureBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/games.json'),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.done) {

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          else if (snapshot.hasData) {
            var games = Game.getGamesFromString(snapshot.data.toString());

            return ListView.builder(
              itemCount: games.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(games[index].name),
                  subtitle: Text(games[index].description),
                );
              },
            );     
          }
        }
          
            return Center(child: CircularProgressIndicator(),);
      }
    );
  }
}

class FuturePage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
      ),
      body: FutureBuilderDemo(),
    );
  }
}
