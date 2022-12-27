import 'package:flutter/material.dart';
import 'package:kanji_drawing_animation/kanji_drawing_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Kanji Drawing Demo')),
            body: Column(children: '人食電繁'.split('').map(wrap).toList())));
  }
}

// Wraps an animated kanji into a card with fixed height.
Widget wrap(String kanji) =>
    Card(child: SizedBox(height: 100, child: KanjiDrawingAnimation(kanji)));
