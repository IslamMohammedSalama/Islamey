// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:islamey/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// ignore: must_be_immutable
class SurahBuilder extends StatefulWidget {
  final sura;
  final arabic;
  final suraName;
  int ayah;

  SurahBuilder(
      {super.key, this.sura, this.arabic, this.suraName, required this.ayah});

  @override
  // ignore: library_private_types_in_public_api
  _SurahBuilderState createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {
  bool view = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumbToAyah());
    super.initState();
  }

  jumbToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index: widget.ayah,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    }
    fabIsClicked = false;
  }

  Row verseBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.arabic[index + previousVerses]['aya_text'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: text_color,
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  SafeArea SingleSuraBuilder(LenghtOfSura) {
    String fullSura = '';
    int previousVerses = 0;
    if (widget.sura + 1 != 1) {
      for (int i = widget.sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
      }
    }

    if (!view)
      // ignore: curly_braces_in_flow_control_structures
      for (int i = 0; i < LenghtOfSura; i++) {
        fullSura += " ${(widget.arabic[i + previousVerses]['aya_text'])}";
      }

    return SafeArea(
      child: Container(
        color: backgraundcolor,
        child: view
            ? ScrollablePositionedList.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      (index != 0) || (widget.sura == 0) || (widget.sura == 8)
                          ? const Text('')
                          : const RetunBasmala(),
                      Container(
                        color: backgraundcolor,
                        child: PopupMenuButton(
                            color: backgraundcolor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: verseBuilder(index, previousVerses),
                            ),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      saveBookMark(widget.sura + 1, index);
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.bookmark_add,
                                          color:
                                              Color.fromARGB(255, 56, 115, 59),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'اضافة الي المرجعيات',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 56, 115, 59)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    onTap: () {},
                                    child: const Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.share,
                                          color:
                                              Color.fromARGB(255, 56, 115, 59),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'مشاركة',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 56, 115, 59)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                      ),
                    ],
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: LenghtOfSura,
              )
            : ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.sura + 1 != 1 && widget.sura + 1 != 9
                                ? const RetunBasmala()
                                : const Text(''),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                fullSura, //mushaf mode
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: mushafFontSize,
                                  fontFamily: arabicFont,
                                  color: text_color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    int LengthOfSura = noOfVerses[widget.sura];

    return Scaffold(
      backgroundColor: backgraundcolor,
      appBar: AppBar(
        backgroundColor: theAppColor,
        actions: [
          Tooltip(
            message: 'وضعية المصحف',
            child: TextButton(
              child: const Icon(
                Icons.chrome_reader_mode,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  view = !view;
                });
              },
            ),
          ),
        ],
        centerTitle: true,
        title: Hero(
          tag: widget.suraName,
          child: Text(
            // widget.
            widget.suraName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: text_color,
                fontFamily: 'quran',
                shadows: const [
                  Shadow(
                    offset: Offset(.5, .5),
                    blurRadius: 1.0,
                    color: Color.fromARGB(255, 130, 130, 130),
                  )
                ]),
          ),
        ),
      ),
      body: SingleSuraBuilder(LengthOfSura),
    );
  }
}

class RetunBasmala extends StatelessWidget {
  const RetunBasmala({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Text(
          'بسم الله الرحمن الرحيم',
          style: TextStyle(
              fontFamily: 'me_quran', fontSize: 30, color: text_color),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
