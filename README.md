# kanji_drawing_animation

[![pub package](https://img.shields.io/pub/v/kanji_drawing_animation.svg)](https://pub.dartlang.org/packages/kanji_drawing_animation)

A widget that draws Kanji with the right stroke order. The kanji stroke order data comes from <https://github.com/KanjiVG/kanjivg>.


<img src="https://github.com/atn832/kanji_drawing_animation/raw/main/kanji_drawing_animation.gif" width="360" />


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
