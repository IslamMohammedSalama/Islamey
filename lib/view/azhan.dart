// ignore_for_file: non_constant_identifier_names , camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:Islamey/view/homepage.dart';

class azan extends StatefulWidget {
  const azan({super.key});

  @override
  State<azan> createState() => _azanState();
}

class _azanState extends State<azan> {
  Future<Map> GetTheDate() async {
    var respo = await get(Uri.parse(
        "http://api.aladhan.com/v1/timingsByCity?city=cairo&country=egypt&method=5"));
    return jsonDecode(respo.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: GetTheDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
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
          return ListView.builder(
            itemCount: times.length,
            itemBuilder: (context, index) {
              if (frod.keys.toList().contains(times.keys.toList()[index])) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.red,
                  child: ListTile(
                    onTap: () => showDialog(
                      builder: (context) => AlertDialog(
                        backgroundColor: backgraundcolor,
                        title: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              "مواقيت صلاة ${frod[times.keys.toList()[index]]}",
                              style: TextStyle(color: text_color),
                            )),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("حسنا",
                                style: TextStyle(color: text_color)),
                          )
                        ],
                        content: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "سيؤذن صلاة  ${frod[times.keys.toList()[index]]} في تمام الساعة : ${times[times.keys.toList()[index]]}",
                            style: TextStyle(color: text_color),
                          ),
                        ),
                      ),
                      context: context,
                    ),
                    title: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "${frod[times.keys.toList()[index]]}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    subtitle: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        " يؤذن في تمام الساعة : ${times[times.keys.toList()[index]]}",
                        style: const TextStyle(
                            fontFamily: "IBMPlexSansArabic-Thin",
                            fontSize: 20,
                            color: Color.fromARGB(255, 90, 90, 90),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
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
