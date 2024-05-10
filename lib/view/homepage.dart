// ignore_for_file: unused_import, must_be_immutable, non_constant_identifier_names

import 'dart:io';

import 'package:Islamey/packages/quran/index.dart';
import 'package:Islamey/view/about.dart';
import 'package:Islamey/view/spha.dart';
import 'package:flutter/material.dart';
import 'package:Islamey/view/azkar_page.dart';
import 'package:Islamey/core/azkar_list.dart';
import 'package:Islamey/view/azhan.dart';
import 'package:flutter/scheduler.dart';
import 'package:Islamey/view/settings_page.dart';
import 'package:path_provider/path_provider.dart';

var brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;
Color? backgraundcolor;
Color text_color = const Color.fromARGB(255, 255, 255, 255);
bool? state;
Color? settings_text_color;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selected_index = 0;
  PageController pageController = PageController();
  int counter = 0;
  @override
  void initState() {
    if (isDarkMode) {
      backgraundcolor = const Color.fromARGB(255, 0, 0, 0);
      text_color = const Color.fromARGB(255, 255, 255, 255);
      state = true;
    } else {
      backgraundcolor = const Color.fromARGB(255, 255, 255, 255);
      text_color = const Color.fromARGB(255, 0, 0, 0);
      state = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgraundcolor,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          backgroundColor: const Color.fromARGB(255, 0, 102, 255),
          unselectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: selected_index,
          onTap: (index_of_change) {
            setState(() {
              selected_index = index_of_change;
            });
            pageController.jumpToPage(selected_index);
            pageController.animateToPage(selected_index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/icons/zkr.png',
                ),
                size: 25,
              ),
              label: "االأذكار",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/icons/moshaf.png',
                ),
                size: 25,
              ),
              label: "القرآن",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/icons/spha.png',
                ),
                size: 25,
              ),
              label: "السبحة",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/icons/sala.png',
                ),
                size: 25,
              ),
              label: "الصلاة",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "الاعدادات",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
              ),
              label: "عنا",
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(
            'مرحبا في برنامح اسلامي',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
        ),
        body: PageView(
          controller: pageController,
          children: [
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2.5,
                crossAxisSpacing: 2.5,
                childAspectRatio: 1,
                mainAxisExtent: 150,
                
              ),
              children: [
                ...List.generate(azkars.keys.toList().length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Builder(
                            builder: (context) =>
                                AzkarPage(title: azkars.keys.toList()[index]),
                          ),
                        ),
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Card(
                      color: Colors.blue,
                      child: SizedBox(
                        height: 100,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              azkars.keys.toList()[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "IBMPlexSansArabic-Thin"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
            const IndexPage(),
            Spha(counter: counter),
            const azan(),
            const SettingPage(),
            const AboutPage()
          ],
          onPageChanged: (index_of_change) {
            setState(() {
              selected_index = index_of_change;
            });
          },
        ));
  }
}
