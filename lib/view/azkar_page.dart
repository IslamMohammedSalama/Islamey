// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:Islamey/core/azkar_list.dart';
import 'package:Islamey/view/homepage.dart';

class AzkarPage extends StatefulWidget {
  String title;

  AzkarPage({
    super.key,
    required this.title,
  });

  @override
  State<AzkarPage> createState() => _AzkarPageState();
}

Widget getthezekr(String title) {
  if (azkars.containsKey(title)) {
    return PageView(
      reverse: true,
      children: [
        ...List.generate(azkars[title]!.length, (index) {
          int counter = 0;
          return azkar(counter: counter, title: title, index: index);
        })
      ],
    );
  }

  return const Text("");
}

class _AzkarPageState extends State<AzkarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgraundcolor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: "IBMPlexSansArabic-Thin",
              fontSize: 15,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: getthezekr(widget.title),
    );
  }
}

class azkar extends StatefulWidget {
  int counter;
  String title;
  int index;
  azkar(
      {super.key,
      required this.counter,
      required this.title,
      required this.index});

  @override
  State<azkar> createState() => _azkarState();
}

class _azkarState extends State<azkar> {
  @override
  Widget build(BuildContext context) {
    if (azkars[widget.title]![widget.index] != "أذكار الاستيقاظ من النوم") {
      if (widget.title != "تسابيح") {
        return Container(
            margin: const EdgeInsets.all(5),
            child: InkWell(
                onTap: () {
                  if (widget.title != "تسابيح") {
                    if (widget.counter ==
                        azkars[widget.title]![widget.index][1]) {
                      return;
                    } else {
                      setState(() {
                        widget.counter++;
                      });
                    }
                  } else {
                    setState(() {
                      widget.counter++;
                    });
                  }
                },
                child: Container(
                    color: const Color.fromARGB(115, 85, 85, 85),
                    child: Center(
                        child: Column(children: [
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 10),
                        color: const Color.fromARGB(255, 75, 75, 75),
                        height: 250,
                        width: double.infinity,
                        child: ListView(
                          padding: const EdgeInsets.all(8.0),
                          shrinkWrap: true,
                          children: [
                            Text(" ${azkars[widget.title]![widget.index][0]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: "IBMPlexSansArabic-Thin",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900)),
                                    const Divider(thickness: 1,color: Color.fromARGB(255, 35, 35, 35),),
                            Text(" ${azkars[widget.title]![widget.index][2]}",
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 200, 200, 200),
                                    fontFamily: "IBMPlexSansArabic-Thin",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900))
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 0, 195, 5),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${azkars[widget.title]!.length}/${azkars[widget.title]!.indexOf(azkars[widget.title]![widget.index]) + 1}",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: "digital-mono",
                                              fontSize: 25,
                                              fontWeight: FontWeight.w100)),
                                      Text(
                                        "  تقال ${azkars[widget.title]![widget.index][1]} من المرات",
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: "IBMPlexSansArabic-Thin",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ]),
                                RichText(
                                  text: TextSpan(children: <TextSpan>[
                                    const TextSpan(
                                        text: "عدد المرات الفعلية :"),
                                    TextSpan(
                                        text: " ${widget.counter}",
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: "digital-Mono",
                                            fontSize: 25,
                                            fontWeight: FontWeight.w100))
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ])))));
      } else {
        return Container(
          margin: const EdgeInsets.all(5),
          child: InkWell(
            onTap: () {
              if (widget.title != "تسابيح") {
                if (widget.counter == azkars[widget.title]![widget.index][1]) {
                  return;
                } else {
                  setState(() {
                    widget.counter++;
                  });
                }
              } else {
                setState(() {
                  widget.counter++;
                });
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
                      color: const Color.fromARGB(255, 75, 75, 75),
                      height: 250,
                      width: double.infinity,
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        children: [
                          Text(" ${azkars[widget.title]![widget.index][0]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: "IBMPlexSansArabic-Thin",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900)),
                          const Divider(
                            color: Color.fromARGB(255, 0, 0, 0),
                            thickness: 1,
                          ),
                          Text("${azkars[widget.title]![widget.index][2]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: "IBMPlexSansArabic-Thin",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 195, 5),
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
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: "digital-mono",
                                            fontSize: 25,
                                            fontWeight: FontWeight.w100)),
                                    const Text(
                                      "  تقال عدد لا نهائي من المرات",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontFamily: "IBMPlexSansArabic-Thin",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ]),
                              RichText(
                                text: TextSpan(children: <TextSpan>[
                                  const TextSpan(text: "عدد المرات الفعلية :"),
                                  TextSpan(
                                      text: " ${widget.counter}",
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: "digital-Mono",
                                          fontSize: 25,
                                          fontWeight: FontWeight.w100))
                                ]),
                              )
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
      }
    } else if (azkars[widget.title]![widget.index] ==
        """أذكار الاستيقاظ من النوم""") {
      return Card(
        color: const Color.fromARGB(115, 102, 255, 0),
        child: Center(
          child: Text("${azkars[widget.title]![widget.index]} ",
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: "IBMPlexSansArabic-Thin",
                fontSize: 30,
                fontWeight: FontWeight.w900,
              )),
        ),
      );
    }

    return Container();
  }
}
