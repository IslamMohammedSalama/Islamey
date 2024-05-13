// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:islamey/view/homepage.dart';

class Spha extends StatefulWidget {
  int counter;
  Spha({super.key, required this.counter});

  @override
  State<Spha> createState() => _SphaState();
}

class _SphaState extends State<Spha> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: MaterialButton(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "عدد التسبيحات",
                        style: TextStyle(
                          fontFamily: "IBMPlexSansArabic-Thin",
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: text_color,
                        ),
                      ),
                      Text(
                        "${widget.counter}",
                        style: TextStyle(
                            color: text_color,
                            fontFamily: "digital-normel",
                            fontSize: 75),
                      ),
                      Text(
                        "سبح ",
                        style: TextStyle(
                          fontFamily: "IBMPlexSansArabic-Thin",
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: text_color,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            onPressed: () {
              setState(() {
                widget.counter++;
              });
            },
          ),
        ),
        Expanded(
          child: MaterialButton(
            minWidth: double.infinity,
            onPressed: () {
              setState(() {
                widget.counter = 0;
              });
            },
            child: Text(
              "تصفير العداد",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "IBMPlexSansArabic-Thin",
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: text_color,
              ),
            ),
          ),
        )
      ],
    );
  }
}
