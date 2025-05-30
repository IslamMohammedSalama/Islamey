import 'package:islamey/core/constants.dart';
import 'package:flutter/material.dart';
import 'to_arabic_no_converter.dart';

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3E${(i + 1).toString().toArabicNumbers}\uFD3F",
      style: TextStyle(
          color: text_color,
          fontFamily: 'me_quran',
          fontSize: 20,
          shadows: const [
            Shadow(
              offset: Offset(.5, .5),
              blurRadius: 1.0,
              color: Colors.amberAccent,
            ),
          ]),
    );
  }
}
