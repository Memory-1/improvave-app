import 'package:flutter/material.dart';
import '../Components/games.dart'; // Import the Products class

class ProductDetailsScreen extends StatelessWidget {
  final Game game;

  ProductDetailsScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${game.name}',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 20),
            Text(
              'Tags: ${game.tags.join(', ')}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Players: ${game.players}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Description: ${game.description}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Example: ${game.example}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
           
          ],
        ),
      ),
    );
  }
}