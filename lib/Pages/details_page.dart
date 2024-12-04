import 'package:flutter/material.dart';
import '../components/game.dart'; // Import the Products class

class ProductDetailsScreen extends StatelessWidget {
  final Game game;

  ProductDetailsScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Go Back", style: TextStyle(color: Color(0xFFfada06)),),
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          inherit: true,
          fontSize: 20, 
          color: Color(0xFFfada06),),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 20),
                Text(
                  'Description: ${game.description}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Example: ${game.example}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}