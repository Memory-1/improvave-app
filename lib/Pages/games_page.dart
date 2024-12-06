import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';
import '../components/game.dart';
import 'details_page.dart';
import '../components/tag_container.dart';


class GamesPageReal extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
      ),
      body: ExpansionTileDemo(),
    );
  }
}

/*
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

            return Scaffold(
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: 
            ListenableBuilder(
              listenable: SearchNotifier(),
              builder: (context, child) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: games.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("Searching for $searchString");
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(game: games[index]),
                          ),
                        );
                      },
                      child: _buildPlayerModelList(games[index], searchString));
                  },
                );
              }
            ),
        ),
    );
          }
        }
          
            return Center(child: CircularProgressIndicator(),);
      }
    );
  }
}
*/

class ExpansionTileDemo extends StatefulWidget {
  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

/*
class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  var games = [];
  
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final searchString = Provider.of<MyAppState>(context, listen: true).searchString;

    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: 
            ListenableBuilder(
              listenable: SearchNotifier(),
              builder: (context, child) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: games.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("Searching for $searchString");
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(game: games[index]),
                          ),
                        );
                      },
                      child: _buildPlayerModelList(games[index], searchString));
                  },
                );
              }
            ),
        ),
    );
  }

  Widget _buildPlayerModelList(Game game, String? filter) {
    if (filter != null && filter.isNotEmpty) {
      var tempFilter = filter.toLowerCase();
      var tempGameName = game.name.toLowerCase();

      if (!tempGameName.contains(tempFilter)) {
        print('Filtering out ${game.name}');
        return Container();
      }
    }

    return Card(
      color: Color(0xFF1a1a1a),
      child: ListTile(
        key: UniqueKey(),
        trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFfada06)
                ),
        title: 
          Text(
            style: TextStyle(color:  Color(0xFFfada06)),
            textAlign: TextAlign.left, 
            game.name,
            ),
        subtitle: 
            Row(
              children:    
                game.tags.map((tag) => TagContainer(tag, Color(0xFFfada06))).toList()            
            ),

      // children: <Widget>[
      //   ListTile(title: Text('Players: ${game.players} \nDescription: ${game.description}\n\nExample: ${game.example}',),
      //   textColor: Color(0xFFfada06),),  
      // ],

        // title: Text(
        //   items.playerName,
        //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        // ),
        // children: <Widget>[
        //   ListTile(
        //     title: Text(
        //       items.description,
        //       style: TextStyle(fontWeight: FontWeight.w700),
            ),
          );     
  }
}
*/

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  var games = [];
  
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final searchString = Provider.of<MyAppState>(context, listen: true).searchString;

    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/games.json'),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.done) {

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          else if (snapshot.hasData) {
            var games = Game.getGamesFromString(snapshot.data.toString());
            games.sort((a, b) => a.name.compareTo(b.name));
            for (var game in games) {
              game.tags.sort();
            }

            return Scaffold(
              body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: 
                  ListenableBuilder(
                    listenable: SearchNotifier(),
                    builder: (context, child) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: games.length,
                        itemBuilder: (BuildContext context, int index) {
                          print("Searching for $searchString");
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(game: games[index]),
                                ),
                              );
                            },
                            child: _buildPlayerModelList(games[index], searchString));
                        },
                      );
                    }
                  ),
              ),
            );
          }
        }
          
            return Center(child: CircularProgressIndicator(),);
      }
    );
     }

  Widget _buildPlayerModelList(Game game, String? filter) {
    if (filter != null && filter.isNotEmpty) {
      var tempFilter = filter.toLowerCase();
      var tempGameName = game.name.toLowerCase();
      var tempGameTags = game.tags.map((tag) => tag.toLowerCase()).toList();

      bool tagContainsFilter = false;
      for (var tag in tempGameTags) {
        if (tag.contains(tempFilter)) {
          tagContainsFilter = true;
          break;
        }
      }

      if (!tempGameName.contains(tempFilter) && !tagContainsFilter) {
        print('Filtering out ${game.name}');
        return Container();
      }
    }

    return Card(
      color: Color(0xFF1a1a1a),
      child: ListTile(
        key: UniqueKey(),
        trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFfada06)
                ),
        title: 
          Text(
            style: TextStyle(color:  Color(0xFFfada06)),
            textAlign: TextAlign.left, 
            game.name,
            ),
        subtitle: 
            Row(
              children:    
                game.tags.map((tag) => TagContainer(tag, Color(0xFFfada06))).toList()            
            ),

      // children: <Widget>[
      //   ListTile(title: Text('Players: ${game.players} \nDescription: ${game.description}\n\nExample: ${game.example}',),
      //   textColor: Color(0xFFfada06),),  
      // ],

        // title: Text(
        //   items.playerName,
        //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        // ),
        // children: <Widget>[
        //   ListTile(
        //     title: Text(
        //       items.description,
        //       style: TextStyle(fontWeight: FontWeight.w700),
            ),
          );     
  }
}




class SearchBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      

    return TextField(
    onChanged: (value) => Provider.of<MyAppState>(context, listen: false).setCurrentValue(value),
      style: TextStyle(color: Color(0xFFfada06)),
      cursorColor: Color(0xFFfada06),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color:Color(0xFFfada06),),
        prefixIcon: Icon(Icons.search, color: Color(0xFFfada06),),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFfada06),),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFfada06),),
        ),
      ),
      
    );
  }
}

class SearchNotifier extends ChangeNotifier {
  String? _searchString;
  String? get searchString => _searchString;

  void setCurrentValue(String changedString) {
    _searchString = changedString;
    notifyListeners();
  }
}