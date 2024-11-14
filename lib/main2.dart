import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
              title: Text('Item $index'),
              children: <Widget>[
                ListTile(title: Text('Sub-item 1')),
                ListTile(title: Text('Sub-item 2')),
              ],
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}