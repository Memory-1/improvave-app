import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';


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

class ExpansionTileDemo extends StatefulWidget {
  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  var games = [];
  
  @override
  void initState() {
    games = Game.getGamesFromJson("assets/games.json");

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
              listenable: searchNotifier(),
              builder: (context, child) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: games.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("Searching for $searchString");
                    return _buildPlayerModelList(games[index], searchString);
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
      child: ExpansionTile(
        key: UniqueKey(),
        trailing: Icon(
                  Icons.keyboard_arrow_down,
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

      children: <Widget>[
        ListTile(title: Text('Players: ${game.players} \nDescription: ${game.description}\n\nExample: ${game.example}',),
        textColor: Color(0xFFfada06),),
        
      ],
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

class TagContainer extends StatelessWidget {
  
  final String text;
  final Color color;

  TagContainer(this.text, this.color);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8,4,8,4),
                child: Center(child: Text(text, style: TextStyle(fontWeight: FontWeight.w800),)),
              ),
        ),
      );
  }
}

class Game {

  String name;
  List<String> tags;
  String players;
  String description;
  String example;

  Game(this.name, this.tags, this.players, this.description, this.example);

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      json['name'],
      List<String>.from(json['tags']),
      json['players'],
      json['description'],
      json['example']
    );
  }

  static List<Game> getGamesFromJson(String filepath){
    
    var response = File(filepath).readAsStringSync();


    List<Game> games = (json.decode(response) as List)
      .map((data) => Game.fromJson(data))
      .toList();
    return games;
  }

  static List<Game> getGames() {

    List<Game> games = [
    Game("Wingman", ["Hype"], "4", "Hype up the homies", "You lookin fly"),
    Game("Beastie Rap", ["Hype"], "2+", "set up rhymes for your friends","(Loud is suggestion) I'm high up in the sky like a CLOUD"),
    Game("What did you say", ["Rhyming","Scene Work"], "2", "Whenever someone says 'What did you say', the other person has to say a new sentence with a word that rhymes", "You look pretty denice \n What did you say? \n I said you look shitty"),
    Game("I Wish", ["Step-out", "Warmup"], "Any", "Everyone lines up and wishes for weird things. Either build off what others have said or start a new thread", "I wish my could do a backflip\nI wish all cars had a popcorn bucket holder"),
    Game("Roulette", ["Competion", "Memorizing"], "3+", "The game begins with everyone in a circle. Some music will begin and everyone will move around in the circle until the music stops. Once the music stops, the front two players will then begin a scene. The last word of the scene will become banned for all future scenes.\nGoing forward keep repeating by playing music and starting a new scene with the last banned word being the prompt for the next scene.\nThe game ends when one person is left standing.\nThe winner does a monologue using all of the banned words", "*Some party music begins playing*\nThe first scene happens and the last word is 'Peanuts'\nNext scene:\n Person A: Hey what do you put on a PB&J\n Person B: Oh, just jelly and some peanut butter. -- That person is then out and "),
   ];

    return games;
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

class searchNotifier extends ChangeNotifier {
  String? _searchString;
  String? get searchString => _searchString;

  void setCurrentValue(String changedString) {
    _searchString = changedString;
    notifyListeners();
  }
}