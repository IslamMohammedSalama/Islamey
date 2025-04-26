// ignore_for_file: non_constant_identifier_names , camel_case_types

import 'dart:convert';
import 'package:islamey/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:quickalert/quickalert.dart';

class azan extends StatefulWidget {
  const azan({super.key});

  @override
  State<azan> createState() => _azanState();
}

class _azanState extends State<azan> {
  DateFormat time_formater = DateFormat("hh:mm a");
  Future<Map> _GetTheDate() async {
    var respo = await get(Uri.parse(
        "http://api.aladhan.com/v1/timingsByCity?city=cairo&country=egypt&method=5"));
    return jsonDecode(respo.body);
  }

  String translateToArabic(String time) {
    if (time.endsWith("AM")) {
      return time.replaceAll("AM", "صباحًا");
    } else if (time.endsWith("PM")) {
      return time.replaceAll("PM", "مساءً");
    }
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _GetTheDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: theAppColor,
            ),
            // child:CupertinoActivityIndicator(color: theAppColor,),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          var times = snapshot.data?["data"]["timings"];
          Map<String, String> frod = {
            "Fajr": "الفجر",
            "Sunrise": "الشروق",
            "Dhuhr": "الظهر",
            "Asr": "العصر",
            "Maghrib": "المغرب",
            "Isha": "العشاء",
          };
          return RefreshIndicator(
            backgroundColor: backgraundcolor,
            color: theAppColor,
            onRefresh: _GetTheDate,
            child: ListView.builder(
              itemCount: times.length,
              itemBuilder: (context, index) {
                if (frod.keys.toList().contains(times.keys.toList()[index])) {
                  return Container(
                    margin: const EdgeInsets.only(top: 1),
                    color: theAppColor,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        onTap: () {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.info,
                              backgroundColor: backgraundcolor,
                              animType: QuickAlertAnimType.slideInUp,
                              title:
                                  "مواقيت صلاة ${frod[times.keys.toList()[index]]}",
                              text:
                                  "سيؤذن صلاة  ${frod[times.keys.toList()[index]]} في تمام الساعة : ${is24HourFormat ? times[times.keys.toList()[index]] : translateToArabic(time_formater.format(DateFormat.Hm().parse(times[times.keys.toList()[index]])))}",
                              textColor: text_color,
                              titleColor: text_color,
                              confirmBtnColor: theAppColor!,
                              confirmBtnText: "حسنا");
                        },
                        title: Text(
                          "${frod[times.keys.toList()[index]]}",
                          style: TextStyle(
                              color: text_color,
                              fontFamily: "IBMPlexSansArabic-Thin",
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        subtitle: Text(
                          " يؤذن في تمام الساعة : ${is24HourFormat ? times[times.keys.toList()[index]] : translateToArabic(time_formater.format(DateFormat.Hm().parse(times[times.keys.toList()[index]])))}",
                          style: const TextStyle(
                              fontFamily: "IBMPlexSansArabic-Thin",
                              fontSize: 20,
                              color: Color.fromARGB(255, 165, 165, 165),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "تعذر تجهيز مواقيت الصلاة بسبب : ${snapshot.error}",
              style: TextStyle(
                  fontFamily: "IBMPlexSansArabic-Thin",
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: text_color),
            ),
          );
        }
        return Container();
      },
    );
  }
}
