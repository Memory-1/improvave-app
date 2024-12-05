import 'dart:convert';
import 'dart:io';

class Game {

  String name;
  List<String> tags;
  String players;
  String description;
  String example;
  String? video;

  Game(this.name, this.tags, this.players, this.description, this.example, {this.video});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      json['name'],
      List<String>.from(json['tags']),
      json['players'],
      json['description'],
      json['example'],
      video: json['video'] ?? "",
    );
  }

  static Future<List<Game>> getGamesFromJson(String filepath) async {
    
    var response = await File(filepath).readAsString(); //I Should probably return the future and then let the Future builder handle it
  


    List<Game> games = (json.decode(response) as List)
      .map((data) => Game.fromJson(data))
      .toList();
    return games;
  }

    static List<Game> getGamesFromString(String input)  {
       
    List<Game> games = (json.decode(input) as List)
      .map((data) => Game.fromJson(data))
      .toList();
    return games;
  }
 }
