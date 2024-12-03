import 'dart:convert';
import 'dart:io';

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
