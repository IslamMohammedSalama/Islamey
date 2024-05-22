import 'package:islamey/core/constants.dart';
import 'package:flutter/material.dart';
import 'surah_builder.dart';
import 'arabic_sura_number.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgraundcolor,
      floatingActionButton: FloatingActionButton(
        tooltip: 'الذهاب الي المرجع',
        backgroundColor: theappcolor,
        onPressed: () async {
          fabIsClicked = true;
          if (await readBookmark() == true) {
            Navigator.push(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                    builder: (context) => SurahBuilder(
                          arabic: quran[0],
                          sura: bookmarkedSura - 1,
                          suraName: arabicName[bookmarkedSura - 1]['name'],
                          ayah: bookmarkedAyah,
                        )));
          }
        },
        child: const Icon(Icons.bookmark),
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Container indexCreator(quran, context) {
    return Container(
      color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              color: backgraundcolor,
              child: MaterialButton(
                child: Row(
                  children: [
                    ArabicSuraNumber(i: i),
                    const SizedBox(
                      width: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Hero(
                      tag: arabicName[i]['name'],
                      child: Text(
                        arabicName[i]['name'],
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
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurahBuilder(
                              arabic: quran[0],
                              sura: i,
                              suraName: arabicName[i]['name'],
                              ayah: 0,
                            )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
