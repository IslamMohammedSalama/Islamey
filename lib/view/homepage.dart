// ignore_for_file: unused_import, must_be_immutable, non_constant_identifier_names

import 'dart:async' show Timer;
import 'dart:io';

import 'package:islamey/core/constants.dart';
import 'package:islamey/packages/quran/index.dart';
import 'package:islamey/view/about.dart';
import 'package:islamey/view/customdrawer.dart';
import 'package:islamey/view/spha.dart';
import 'package:flutter/material.dart';
import 'package:islamey/view/azkar_page.dart';
import 'package:islamey/core/azkar_list.dart';
import 'package:islamey/view/azhan.dart';
import 'package:islamey/view/settings_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String title = "الأزكار";
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
    pageController.addListener(() {
      setState(() {
        selected_index = pageController.page!.round();
      });
    });
    super.initState();
    // Initialize a periodic timer that runs every minute
     fetchAndScheduleNotifications();
  }
Future<void> fetchAndScheduleNotifications() async {
    try {
      final prayerTimes = await fetchPrayerTimes();
      await schedulePrayerNotifications(prayerTimes);
    } catch (e) {
      print('Failed to fetch and schedule notifications: $e');
    }
  }
  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const CustomDrawer(),
        backgroundColor: backgraundcolor,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 255, 17, 0),
          backgroundColor: theAppColor,
          unselectedLabelStyle: const TextStyle(
              fontFamily: "IBMPlexSansArabic-Thin",
              fontSize: 15,
              fontWeight: FontWeight.w900),
          selectedLabelStyle: const TextStyle(
              fontFamily: "IBMPlexSansArabic-Thin",
              fontSize: 15,
              fontWeight: FontWeight.w900),
          unselectedItemColor: Colors.blue[225],
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: selected_index,
          onTap: (index_of_change) {
            setState(() {
              selected_index = index_of_change;
              pageController.animateToPage(selected_index,
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.ease);
            });
            if (selected_index == 0) {
              setState(() {
                title = "الأزكار";
              });
            } else if (selected_index == 1) {
              setState(() {
                title = "القرآن";
              });
            } else if (selected_index == 2) {
              setState(() {
                title = "السبحة";
              });
            } else if (selected_index == 3) {
              setState(() {
                title = "الصلاة";
              });
            } else if (selected_index == 4) {
              setState(() {
                title = "الاعدادات";
              });
            } else if (selected_index == 5) {
              setState(() {
                title = "عنا";
              });
            }
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
            title,
            style:const TextStyle(
                fontFamily: "IBMPlexSansArabic-Thin",
                fontSize: 30,
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          backgroundColor: theAppColor,
        ),
        body: PageView(
          controller: pageController,
          children: [
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
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
                      margin: const EdgeInsets.all(1.5),
                      color: theAppColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                      child: SizedBox(
                        height: 100,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Hero(
                              tag: azkars.keys.toList()[index],
                              child: Text(
                                azkars.keys.toList()[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "IBMPlexSansArabic-Thin"),
                              ),
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
            if (selected_index == 0) {
              setState(() {
                title = "الأزكار";
              });
            } else if (selected_index == 1) {
              setState(() {
                title = "القرآن";
              });
            } else if (selected_index == 2) {
              setState(() {
                title = "السبحة";
              });
            } else if (selected_index == 3) {
              setState(() {
                title = "الصلاة";
              });
            } else if (selected_index == 4) {
              setState(() {
                title = "الاعدادات";
              });
            } else if (selected_index == 5) {
              setState(() {
                title = "عنا";
              });
            }
          },
        ));
  }
}
