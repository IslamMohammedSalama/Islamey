// ignore_for_file: unused_import

import 'package:Islamey/packages/quran/constant.dart';
import 'package:flutter/material.dart';
import 'package:Islamey/view/homepage.dart';
import 'package:Islamey/view/azkar_page.dart';

void main() {
  
  runApp(const MyApp());
  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      await getSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "اسلامي",
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Colors.red,
          ),
          textTheme: const TextTheme(
            bodySmall: TextStyle(
                fontFamily: "IBMPlexSansArabic-Thin",
                fontSize: 20,
                fontWeight: FontWeight.w900),
            bodyMedium:
                TextStyle(fontFamily: "IBMPlexSansArabic-Medium", fontSize: 25),
            bodyLarge:
                TextStyle(fontFamily: "IBMPlexSansArabic-Bold", fontSize: 20),
          )),
    );
  }
}
