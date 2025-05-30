// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:islamey/services/notfi_serv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:flutter/scheduler.dart';




Color textColor = const Color.fromARGB(255, 255, 255, 255);
Color backgraundcolor = const Color.fromARGB(255, 0, 0, 0);
Color? theAppColor;

int selected_index = 0;
PageController pageController = PageController();
int counter = 0;
var brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;
Color text_color = const Color.fromARGB(255, 255, 255, 255);
bool? state;
Color? settings_text_color;
bool is24HourFormat = false;

int bookmarkedAyah = 1;
int bookmarkedSura = 1;
bool fabIsClicked = true;
List<Color> avilableColors = const [
Color(0xffff1565c0),
Color(0xffffff0000),
Color(0xff00bcd4),
Color(0x7d9c5e00),
Color(0xffff9c27b0),
Color(0xff2196f3),
Color(0xff673ab7),
Color(0xff4caf50),
Color(0xff7d7000),
Color(0xff643c00),
Color(0xff5a6419),
Color(0xff009688),
Color(0xff795548),
Color(0x9a7a0000),
Color(0xffff5722),
Color(0xffb66d49)

];

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

String arabicFont = 'quran';
double arabicFontSize = 28;
double mushafFontSize = 40;

Uri quranAppurl = Uri.parse('https://github.com/itsherifahmed');

Future saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('arabicFontSize', arabicFontSize.toInt());
  await prefs.setInt('mushafFontSize', mushafFontSize.toInt());
  await prefs.setBool('is24HourFormat', is24HourFormat);
  await prefs.setBool('isDarkMode', isDarkMode);
  await prefs.setInt("ColorValue", theAppColor!.value);
}

Future getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();    theAppColor = Color(prefs.getInt("ColorValue")!);
    arabicFontSize = prefs.getInt('arabicFontSize')!.toDouble();
    mushafFontSize = prefs.getInt('mushafFontSize')!.toDouble();
    is24HourFormat = prefs.getBool('is24HourFormat')!;
    isDarkMode = prefs.getBool('isDarkMode')!;

  } catch (_) {    theAppColor = const Color(0xffff1565c0);
    arabicFontSize = 28;
    mushafFontSize = 40;
    is24HourFormat = false;
    isDarkMode = true;

  }
}

void saveBookMark(surah, ayah) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("surah", surah);
  await prefs.setInt("ayah", ayah);
}

Future<bool> readBookmark() async {
  final prefs = await SharedPreferences.getInstance();
  try {
    bookmarkedAyah = prefs.getInt('ayah')!;
    bookmarkedSura = prefs.getInt('surah')!;
    return true;
  } catch (e) {
    return false;
  }
}

List<Map> arabicName = [
  {"surah": "1", "name": "الفاتحة"},
  {"surah": "2", "name": "البقرة"},
  {"surah": "3", "name": "آل عمران"},
  {"surah": "4", "name": "النساء"},
  {"surah": "5", "name": "المائدة"},
  {"surah": "6", "name": "الأنعام"},
  {"surah": "7", "name": "الأعراف"},
  {"surah": "8", "name": "الأنفال"},
  {"surah": "9", "name": "التوبة"},
  {"surah": "10", "name": "يونس"},
  {"surah": "11", "name": "هود"},
  {"surah": "12", "name": "يوسف"},
  {"surah": "13", "name": "الرعد"},
  {"surah": "14", "name": "ابراهيم"},
  {"surah": "15", "name": "الحجر"},
  {"surah": "16", "name": "النحل"},
  {"surah": "17", "name": "الإسراء"},
  {"surah": "18", "name": "الكهف"},
  {"surah": "19", "name": "مريم"},
  {"surah": "20", "name": "طه"},
  {"surah": "21", "name": "الأنبياء"},
  {"surah": "22", "name": "الحج"},
  {"surah": "23", "name": "المؤمنون"},
  {"surah": "24", "name": "النور"},
  {"surah": "25", "name": "الفرقان"},
  {"surah": "26", "name": "الشعراء"},
  {"surah": "27", "name": "النمل"},
  {"surah": "28", "name": "القصص"},
  {"surah": "29", "name": "العنكبوت"},
  {"surah": "30", "name": "الروم"},
  {"surah": "31", "name": "لقمان"},
  {"surah": "32", "name": "السجدة"},
  {"surah": "33", "name": "الأحزاب"},
  {"surah": "34", "name": "سبإ"},
  {"surah": "35", "name": "فاطر"},
  {"surah": "36", "name": "يس"},
  {"surah": "37", "name": "الصافات"},
  {"surah": "38", "name": "ص"},
  {"surah": "39", "name": "الزمر"},
  {"surah": "40", "name": "غافر"},
  {"surah": "41", "name": "فصلت"},
  {"surah": "42", "name": "الشورى"},
  {"surah": "43", "name": "الزخرف"},
  {"surah": "44", "name": "الدخان"},
  {"surah": "45", "name": "الجاثية"},
  {"surah": "46", "name": "الأحقاف"},
  {"surah": "47", "name": "محمد"},
  {"surah": "48", "name": "الفتح"},
  {"surah": "49", "name": "الحجرات"},
  {"surah": "50", "name": "ق"},
  {"surah": "51", "name": "الذاريات"},
  {"surah": "52", "name": "الطور"},
  {"surah": "53", "name": "النجم"},
  {"surah": "54", "name": "القمر"},
  {"surah": "55", "name": "الرحمن"},
  {"surah": "56", "name": "الواقعة"},
  {"surah": "57", "name": "الحديد"},
  {"surah": "58", "name": "المجادلة"},
  {"surah": "59", "name": "الحشر"},
  {"surah": "60", "name": "الممتحنة"},
  {"surah": "61", "name": "الصف"},
  {"surah": "62", "name": "الجمعة"},
  {"surah": "63", "name": "المنافقون"},
  {"surah": "64", "name": "التغابن"},
  {"surah": "65", "name": "الطلاق"},
  {"surah": "66", "name": "التحريم"},
  {"surah": "67", "name": "الملك"},
  {"surah": "68", "name": "القلم"},
  {"surah": "69", "name": "الحاقة"},
  {"surah": "70", "name": "المعارج"},
  {"surah": "71", "name": "نوح"},
  {"surah": "72", "name": "الجن"},
  {"surah": "73", "name": "المزمل"},
  {"surah": "74", "name": "المدثر"},
  {"surah": "75", "name": "القيامة"},
  {"surah": "76", "name": "الانسان"},
  {"surah": "77", "name": "المرسلات"},
  {"surah": "78", "name": "النبإ"},
  {"surah": "79", "name": "النازعات"},
  {"surah": "80", "name": "عبس"},
  {"surah": "81", "name": "التكوير"},
  {"surah": "82", "name": "الإنفطار"},
  {"surah": "83", "name": "المطففين"},
  {"surah": "84", "name": "الإنشقاق"},
  {"surah": "85", "name": "البروج"},
  {"surah": "86", "name": "الطارق"},
  {"surah": "87", "name": "الأعلى"},
  {"surah": "88", "name": "الغاشية"},
  {"surah": "89", "name": "الفجر"},
  {"surah": "90", "name": "البلد"},
  {"surah": "91", "name": "الشمس"},
  {"surah": "92", "name": "الليل"},
  {"surah": "93", "name": "الضحى"},
  {"surah": "94", "name": "الشرح"},
  {"surah": "95", "name": "التين"},
  {"surah": "96", "name": "العلق"},
  {"surah": "97", "name": "القدر"},
  {"surah": "98", "name": "البينة"},
  {"surah": "99", "name": "الزلزلة"},
  {"surah": "100", "name": "العاديات"},
  {"surah": "101", "name": "القارعة"},
  {"surah": "102", "name": "التكاثر"},
  {"surah": "103", "name": "العصر"},
  {"surah": "104", "name": "الهمزة"},
  {"surah": "105", "name": "الفيل"},
  {"surah": "106", "name": "قريش"},
  {"surah": "107", "name": "الماعون"},
  {"surah": "108", "name": "الكوثر"},
  {"surah": "109", "name": "الكافرون"},
  {"surah": "110", "name": "النصر"},
  {"surah": "111", "name": "المسد"},
  {"surah": "112", "name": "الإخلاص"},
  {"surah": "113", "name": "الفلق"},
  {"surah": "114", "name": "الناس"}
];

List<int> noOfVerses = [
  7,
  286,
  200,
  176,
  120,
  165,
  206,
  75,
  129,
  109,
  123,
  111,
  43,
  52,
  99,
  128,
  111,
  110,
  98,
  135,
  112,
  78,
  118,
  64,
  77,
  227,
  93,
  88,
  69,
  60,
  34,
  30,
  73,
  54,
  45,
  83,
  182,
  88,
  75,
  85,
  54,
  53,
  89,
  59,
  37,
  35,
  38,
  29,
  18,
  45,
  60,
  49,
  62,
  55,
  78,
  96,
  29,
  22,
  24,
  13,
  14,
  11,
  11,
  18,
  12,
  12,
  30,
  52,
  52,
  44,
  28,
  28,
  20,
  56,
  40,
  31,
  50,
  40,
  46,
  42,
  29,
  19,
  36,
  25,
  22,
  17,
  19,
  26,
  30,
  20,
  15,
  21,
  11,
  8,
  8,
  19,
  5,
  8,
  8,
  11,
  11,
  8,
  3,
  9,
  5,
  4,
  7,
  3,
  6,
  3,
  5,
  4,
  5,
  6
];

List arabic = [];
List malayalam = [];
List quran = [];

Future<List> readJson() async {
  final String response =
      await rootBundle.loadString("assets/json/hafs_smart_v8.json");
  final data = json.decode(response);
  arabic = data["quran"];
  malayalam = data["malayalam"];
  return quran = [arabic, malayalam];
}

Future<Map<String, String>> fetchPrayerTimes() async {
  final response = await http.get(Uri.parse('http://api.aladhan.com/v1/timingsByCity?city=cairo&country=egypt&method=5'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final timings = data['data']['timings'];
    return {
      'Fajr': timings['Fajr'],
      'Dhuhr': timings['Dhuhr'],
      'Asr': timings['Asr'],
      'Maghrib': timings['Maghrib'],
      'Isha': timings['Isha'],
    };
  } else {
    throw Exception('Failed to load prayer times');
  }
}

Future<void> schedulePrayerNotifications(
    Map<String, String> prayerTimes) async {
  final now = DateTime.now();
  for (var entry in prayerTimes.entries) {
    final timeParts = entry.value.split(':');
    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1]);

    final prayerTime = DateTime(now.year, now.month, now.day, hours, minutes);

    if (prayerTime.isAfter(now)) {
      await Notifservice.scheduleNotification(scheduledNotificationDateTime: prayerTime,title: "حان وقت صلاة");
    }
  }
}
