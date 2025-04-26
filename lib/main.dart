// ignore_for_file: unused_import

import 'dart:async';

import 'package:islamey/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:islamey/services/notfi_serv.dart';
import 'package:islamey/view/homepage.dart';
import 'package:islamey/view/azkar_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Notifservice.init();
  await getSettings();

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
