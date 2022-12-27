import 'package:flutter/material.dart';
import 'package:svg_drawing_animation/svg_drawing_animation.dart';

class KanjiDrawingAnimation extends StatelessWidget {
  const KanjiDrawingAnimation(this.kanji,
      {this.speed = 80, this.curve = Curves.decelerate, super.key})
      : assert(kanji.length == 1);

  final String kanji;
  final double speed;
  final Curve curve;

  // Network cache.
  static final Map<String, SvgProvider> _kanjiToProvider = {};

  @override
  Widget build(BuildContext context) {
    final filename = kanji.codeUnits.first.toRadixString(16).padLeft(5, '0');
    final url =
        'https://raw.githubusercontent.com/KanjiVG/kanjivg/master/kanji/$filename.svg';
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (!_kanjiToProvider.containsKey(kanji)) {
      _kanjiToProvider[kanji] = SvgProvider.network(url);
    }
    return Container(
        // Make the background light even in dark mode.
        color: isDark
            ? Theme.of(context).colorScheme.inverseSurface
            : Theme.of(context).colorScheme.surface,
        child: SvgDrawingAnimation(
          _kanjiToProvider[kanji]!,
          repeats: true,
          speed: speed,
          curve: curve,
          errorWidgetBuilder: (context, error, stackTrace) =>
              const Text('No kanji stroke information'),
          penRenderer: CirclePenRenderer(
              radius: 15,
              paint: Paint()..color = Colors.redAccent.withAlpha(200)),
        ));
  }
}
