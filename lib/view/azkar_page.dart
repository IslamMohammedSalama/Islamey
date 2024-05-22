// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names
import 'package:islamey/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:islamey/core/azkar_list.dart';

class AzkarPage extends StatefulWidget {
  final String title;

  const AzkarPage({
    super.key,
    required this.title,
  });

  @override
  State<AzkarPage> createState() => _AzkarPageState();
}

class _AzkarPageState extends State<AzkarPage> {
  final PageController _azkarPageController = PageController();

  @override
  void dispose() {
    _azkarPageController.dispose();
    super.dispose();
  }

  Widget getTheZekr(String title) {
    return PageView(
      controller: _azkarPageController,
      reverse: true,
      children: List.generate(azkars[title]!.length, (index) {
        return Azkar(
          counter: 0,
          title: title,
          index: index,
          pageController: _azkarPageController,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgraundcolor,
      appBar: AppBar(
        backgroundColor: theappcolor,
        title: Hero(
          tag: widget.title,
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: "IBMPlexSansArabic-Thin",
              fontSize: 17.5,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: getTheZekr(widget.title),
    );
  }
}

class Azkar extends StatefulWidget {
  int counter;
  final String title;
  final int index;
  final PageController pageController;

  Azkar({
    super.key,
    required this.counter,
    required this.title,
    required this.index,
    required this.pageController,
  });

  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });

    if (widget.counter == azkars[widget.title]![widget.index][1]) {
      if (widget.index + 1 < azkars[widget.title]!.length) {
        widget.pageController.animateToPage(
          widget.index + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (azkars[widget.title]![widget.index] != "أذكار الاستيقاظ من النوم") {
      return Container(
        margin: const EdgeInsets.all(5),
        child: InkWell(
          onTap: () {
            if (widget.title != "تسابيح") {
              if (widget.counter != azkars[widget.title]![widget.index][1]) {
                _incrementCounter();
              }
            } else {
              _incrementCounter();
            }
          },
          child: Container(
            color: const Color.fromARGB(115, 85, 85, 85),
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10),
                    color: theappcolor,
                    height: 250,
                    width: double.infinity,
                    child: ListView(
                      padding: const EdgeInsets.all(8.0),
                      shrinkWrap: true,
                      children: [
                        Text(
                          " ${azkars[widget.title]![widget.index][0]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: "IBMPlexSansArabic-Thin",
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 35, 35, 35),
                        ),
                        Text(
                          " ${azkars[widget.title]![widget.index][2]}",
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 200, 200, 200),
                            fontFamily: "IBMPlexSansArabic-Thin",
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: theappcolor,
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${azkars[widget.title]!.length}/${azkars[widget.title]!.indexOf(azkars[widget.title]![widget.index]) + 1}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: "digital-mono",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                Text(
                                  "  تقال ${azkars[widget.title]![widget.index][1]} من المرات",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: "IBMPlexSansArabic-Thin",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(
                                    style: TextStyle(
                                      fontFamily: "IBMPlexSansArabic-Thin",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    text: "عدد المرات الفعلية :",
                                  ),
                                  TextSpan(
                                    text: " ${widget.counter}",
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontFamily: "digital-Mono",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (azkars[widget.title]![widget.index] ==
        "أذكار الاستيقاظ من النوم") {
      return Card(
        color: const Color.fromARGB(115, 102, 255, 0),
        child: Center(
          child: Text(
            "${azkars[widget.title]![widget.index]} ",
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: "IBMPlexSansArabic-Thin",
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      );
    }

    return Container();
  }
}
