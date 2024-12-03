import 'package:flutter/material.dart';

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
                child: Center(child: Text(text, style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF1F1929)),)),
              ),
        ),
      );
  }
}