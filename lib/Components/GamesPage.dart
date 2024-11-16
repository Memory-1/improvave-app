import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class GameTile {

    GameTile(
      this.title,
      this.body,
      this.tags,
      [this.isExpanded = false]
    );
    String title;
    String body;
    List<String> tags;
    bool isExpanded;

}

class GamesPageState extends ChangeNotifier {
  var favorites = <Game>[];

  void toggleFavorite() {
    notifyListeners();
  }
}

class GamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<GamesPageState>();

    // if (appState.favorites.isEmpty) {
    //   return Center(
    //     child: Text('No favorites yet.'),
    //   );
    // }


    return Container(child: Column(children: [SearchBar(),GamesList()]),);
  }
}

// class GamesList extends StatefulWidget {
//   @override
//   _GamesListState createState() => _GamesListState();

// }

class GamesList extends StatelessWidget {

  String currentSearch = "";
  List<Game> GameList = [
    Game("Wingman", ["Hype"], "4", "Hype up the homies", "You lookin fly"),
    Game("Beastie Rap", ["Hype"], "2+", "set up rhymes for your friends","(Loud is suggestion) I'm high up in the sky like a CLOUD"),
    Game("What did you say", ["Rhyming","Scene Work"], "2", "Whenever someone says 'What did you say', the other person has to say a new sentence with a word that rhymes", "You look pretty denice \n What did you say? \n I said you look shitty"),
   ];

  @override
  Widget build(BuildContext context) {
    return 
         ExpansionList(GameList: GameList);
  }
}

class ExpansionList extends StatelessWidget {
  const ExpansionList({
    super.key,
    required this.GameList,
  });

  final List<Game> GameList;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index
      ) {
        return ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Text(
                style: TextStyle(color:  Color(0xFFfada06)),
                textAlign: TextAlign.left, 
                GameList[index].title,
                ),
              Row(
                children:    
                  
                  GameList[index].tags.map((tag) => TagContainer(tag, Color(0xFFfada06))).toList()         
                // TagContainer("WarmUp", Color.fromARGB(184, 252, 40, 217)),
                // TagContainer("Rhyming", Color.fromARGB(231, 35, 222, 163)),],
            )
            ],
          ),
          children: <Widget>[
            ListTile(title: Text('Players: ${GameList[index].players} \nDescription: ${GameList[index].description}\n\nExample: ${GameList[index].example}',),
            textColor: Color(0xFFfada06),)
            
          ],
        );
      },
      itemCount: GameList.length,
    );
  }
}
// class ExpansionList extends StatelessWidget {
//   const ExpansionList({
//     super.key,
//     required this.GameList,
//   });

//   final List<Game> GameList;

//   ListView listsWidget() {
    
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, int index
//       ) {
//         return ExpansionTile(
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
             
//               Text(
//                 style: TextStyle(color:  Color(0xFFfada06)),
//                 textAlign: TextAlign.left, 
//                 GameList[index].title,
//                 ),
//               Row(
//                 children:    
                  
//                   GameList[index].tags.map((tag) => TagContainer(tag, Color(0xFFfada06))).toList()         
//                 // TagContainer("WarmUp", Color.fromARGB(184, 252, 40, 217)),
//                 // TagContainer("Rhyming", Color.fromARGB(231, 35, 222, 163)),],
//             )
//             ],
//           ),
//           children: <Widget>[
//             ListTile(title: Text('Players: ${GameList[index].players} \nDescription: ${GameList[index].description}\n\nExample: ${GameList[index].example}',),
//             textColor: Color(0xFFfada06),)
            
//           ],
//         );
//       },
//       itemCount: GameList.length,
//     );
//   }
// }

// class _GamesListState extends State<GamesList> {

//   String currentSearch = "";
//   List<Game> GameList = [
//     Game("Wingman", ["Hype"], "4", "Hype up the homies", "You lookin fly"),
//     Game("Beastie Rap", ["Hype"], "2+", "set up rhymes for your friends","(Loud is suggestion) I'm high up in the sky like a CLOUD"),
//     Game("What did you say", ["Rhyming","Scene Work"], "2", "Whenever someone says 'What did you say', the other person has to say a new sentence with a word that rhymes", "You look pretty denice \n What did you say? \n I said you look shitty"),
//    ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color.fromARGB(255, 0, 0, 0),
//         body: ListView.builder(
//           itemBuilder: (BuildContext context, int index
//           ) {
//             return ExpansionTile(
//               title: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
                 
//                   Text(
//                     style: TextStyle(color:  Color(0xFFfada06)),
//                     textAlign: TextAlign.left, 
//                     GameList[index].title,
//                     ),
//                   Row(
//                     children:    
                      
//                       GameList[index].tags.map((tag) => TagContainer(tag, Color(0xFFfada06))).toList()         
//                     // TagContainer("WarmUp", Color.fromARGB(184, 252, 40, 217)),
//                     // TagContainer("Rhyming", Color.fromARGB(231, 35, 222, 163)),],
//                 )
//                 ],
//               ),
//               children: <Widget>[
//                 ListTile(title: Text('Players: ${GameList[index].players} \nDescription: ${GameList[index].description}\n\nExample: ${GameList[index].example}',),
//                 textColor: Color(0xFFfada06),)
                
//               ],
//             );
//           },
//           itemCount: GameList.length,
//         ),
//       );

//   }
// }

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

  String title;
  List<String> tags;
  String players;
  String description;
  String example;

  Game(this.title, this.tags, this.players, this.description, this.example);

  
}

