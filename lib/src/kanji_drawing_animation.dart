import 'package:flutter/material.dart';
import 'package:svg_drawing_animation/svg_drawing_animation.dart';

class KanjiDrawingAnimation extends StatelessWidget {
  const KanjiDrawingAnimation(this.kanji, {super.key});

  final String kanji;
  static final Map<String, SvgProvider> kanjiToProvider = {};

  @override
  Widget build(BuildContext context) {
    final filename = kanji.codeUnits.first.toRadixString(16).padLeft(5, '0');
    final url =
        'https://raw.githubusercontent.com/KanjiVG/kanjivg/master/kanji/$filename.svg';
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (!kanjiToProvider.containsKey(kanji)) {
      kanjiToProvider[kanji] = SvgProvider.network(url);
    }
    return Container(
        color: isDark
            ? Theme.of(context).colorScheme.inverseSurface
            : Theme.of(context).colorScheme.surface,
        child: SvgDrawingAnimation(
          kanjiToProvider[kanji]!,
          repeats: true,
          duration: const Duration(seconds: 3),
          curve: Curves.decelerate,
          errorWidgetBuilder: (context, error, stackTrace) =>
              const Text('No kanji stroke information'),
          penRenderer: CirclePenRenderer(
              radius: 15,
              paint: Paint()..color = Colors.redAccent.withAlpha(200)),
        ));
  }
}
