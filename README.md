# kanji_drawing_animation

A Widget that draws Kanji with the right stroke order. The kanji stroke order data comes from <https://github.com/KanjiVG/kanjivg>.

## Features

- Draws Kanji.
- Customizable speed.
- Works in both light and dark themes.

## Basic usage

```dart
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
            body: const Center(
                child: SizedBox(
                    height: 100,
                    child: KanjiDrawingAnimation('電', speed: 50)))));
  }
}
```
