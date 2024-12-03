import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/Pages/games_page.dart';
import 'package:provider/provider.dart';

import 'Components/big_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color.fromARGB(255, 0, 0, 0),
    secondary: Color(0xFFfada06),
    surface: Color.fromARGB(255, 0, 0, 0),
    // surface: Color.fromARGB(255, 71, 58, 91),
        // surface: Color(0XFF847424),
    onSurface: Color(0xFF1F1929),
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Color(0xFFfada06),
    onSecondary: Color.fromARGB(255, 0, 0, 0),
    brightness: Brightness.dark
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: MyApp.darkColorScheme,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  String? _searchString;
  String? get searchString => _searchString;

  void setCurrentValue(String changedString) {
    _searchString = changedString;
    notifyListeners();
  }

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = GamesPageReal();
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(iconTheme: IconThemeData(color: Color(0xFFfada06)), title: Text("Improv Ave", style: TextStyle(color: Color(0xFFfada06)),)),
        drawer: Drawer(
      
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Image(image: AssetImage('assets/images/BL_logo.png')),
            ),
            ListTile(
              title: const Text('Random Word', style:TextStyle(color: Color(0xFFfada06), fontWeight: FontWeight.bold)),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Games', style:TextStyle(color: Color(0xFFfada06), fontWeight: FontWeight.bold)),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   title: const Text('School'),
            //   selected: _selectedIndex == 2,
            //   onTap: () {
            //     // Update the state of the app
            //     _onItemTapped(2);
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
        body:
          Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),

        );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      
    );

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Center(child: Text("Random Word Suggestion", textAlign: TextAlign.center ,style: style)),
            ),
          ),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: theme.colorScheme.onPrimary),
                ),
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon, color: theme.colorScheme.onPrimary),
                label: Text('Like', style: TextStyle(color: theme.colorScheme.onPrimary)),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: theme.colorScheme.onPrimary),
                ),
                child: Text('Next', style: TextStyle(color: theme.colorScheme.onPrimary)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}





