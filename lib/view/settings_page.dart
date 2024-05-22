// ignore_for_file: unused_import
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:islamey/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:islamey/view/homepage.dart';
import 'package:islamey/view/spha.dart';
import 'package:quickalert/quickalert.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final darkTheme = ThemeData.dark().copyWith(
    // Customize the dark theme colors and properties here
    scaffoldBackgroundColor: backgraundcolor,
    // Add more properties as needed
  );
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme,
      child: SettingsList(
        sections: [
          SettingsSection(
              title: Center(
                  child: Text(
                'الاعدادات',
                style: TextStyle(
                    fontFamily: "IBMPlexSansArabic-Thin",
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: text_color),
              )),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: Text('اللغة',
                      style: TextStyle(
                          fontFamily: "IBMPlexSansArabic-Thin",
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: text_color)),
                  value: Text('العربية',
                      style: TextStyle(
                          fontFamily: "IBMPlexSansArabic-Thin",
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: text_color)),
                ),
                SettingsTile.switchTile(
                  activeSwitchColor: theappcolor,
                  onToggle: (value) {
                    setState(() {
                      state = value;
                      text_color =
                          text_color == const Color.fromARGB(255, 255, 255, 255)
                              ? const Color.fromARGB(255, 0, 0, 0)
                              : const Color.fromARGB(255, 255, 255, 255);
                      backgraundcolor =
                          backgraundcolor == const Color.fromARGB(255, 0, 0, 0)
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : const Color.fromARGB(255, 0, 0, 0);
                    });
                  },
                  initialValue: state,
                  leading: const Icon(Icons.format_paint),
                  title: Text('المظهر الداكن',
                      style: TextStyle(
                          fontFamily: "IBMPlexSansArabic-Thin",
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: text_color)),
                ),
                SettingsTile.switchTile(
                  activeSwitchColor: theappcolor,
                  onToggle: (value) {
                    setState(() {
                      is24HourFormat = value;
                    });
                  },
                  initialValue: is24HourFormat,
                  leading: const Icon(Icons.access_time_filled),
                  title: Text("نظام الساعة 24",
                      style: TextStyle(
                          fontFamily: "IBMPlexSansArabic-Thin",
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: text_color)),
                ),
                SettingsTile.navigation(
                  title: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theappcolor,
                        ),
                        width: 40,
                        height: 40,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text("اللون المفضل ",
                              style: TextStyle(
                                  fontFamily: "IBMPlexSansArabic-Thin",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: text_color))),
                    ],
                  ),
                  trailing: MaterialButton(
                    onPressed: () {
                      QuickAlert.show(
                        cancelBtnText: "الغاء",
                        confirmBtnColor: theappcolor,
                        animType: QuickAlertAnimType.slideInUp,
                        onCancelBtnTap: () => Navigator.pop(context),
                        onConfirmBtnTap: () {

                          setState(() {
                            
                          });
                          Navigator.pop(context);
                        },
                        backgroundColor: backgraundcolor,
                        confirmBtnText: "اختر",
                        context: context,
                        type: QuickAlertType.confirm,
                        title: "تخيير اللون المفضل",
                        titleColor: text_color,
                        widget:  Column(
                          children: [
                            SizedBox(
                              height: 250,
                              child: BlockPicker(
                                  availableColors: const [
                                    Color.fromARGB(255, 21, 101, 192),
                                    Color.fromARGB(255, 255, 0, 0),
                                    Color.fromARGB(255, 0, 188, 212),
                                    Color.fromARGB(255, 255, 152, 0),
                                    Color.fromARGB(255, 156, 39, 176),
                                    Color.fromARGB(255, 33, 150, 243),
                                    Color.fromARGB(255, 103, 58, 183),
                                    Color.fromARGB(255, 76, 175, 80),
                                    Color.fromARGB(255, 255, 235, 59),
                                    Color.fromARGB(255, 100, 60, 0),
                                    Color.fromARGB(255, 90, 100, 25),
                                    Color.fromARGB(255, 0, 150, 136),
                                    Color.fromARGB(255, 121, 85, 72),
                                    Color.fromARGB(154, 122, 0, 0),
                                    Color.fromARGB(255, 255, 87, 34),
                                    Color.fromARGB(255, 182, 109, 73),
                                  ],
                                  pickerColor: theappcolor,
                                  useInShowDialog: true,
                                  onColorChanged: (Color
                                      selectedcolorfromavcolor) {
                                    setState(() {
                                      theappcolor =
                                          selectedcolorfromavcolor;
                                    });
                                  }),
                            ),
                            
                          ],
                        )
                      );
                      
                    },
                    child: Text("تغيير الللون المفضل ",
                        style: TextStyle(
                            fontFamily: "IBMPlexSansArabic-Thin",
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: text_color)),
                  ),
                ),
                SettingsTile.navigation(
                    title: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Divider(
                            thickness: 2,
                          ),
                          Text(
                            'حجم خط اللغة العربية:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: text_color,
                              fontSize: 15,
                            ),
                          ),
                          Slider(
                            activeColor: theappcolor,
                            value: arabicFontSize,
                            min: 20,
                            max: 40,
                            onChanged: (value) {
                              setState(() {
                                arabicFontSize = value;
                              });
                            },
                          ),
                          Text(
                            "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                            style: TextStyle(
                                color: text_color,
                                fontFamily: 'quran',
                                fontSize: arabicFontSize),
                            textDirection: TextDirection.rtl,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Divider(),
                          ),
                          Text(
                            'حجم خط المصحف في وضعية المصحف:',
                            style: TextStyle(
                              color: text_color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Slider(
                            activeColor: theappcolor,
                            value: mushafFontSize,
                            min: 20,
                            max: 50,
                            onChanged: (value) {
                              setState(() {
                                mushafFontSize = value;
                              });
                            },
                          ),
                          Text(
                            "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                            style: TextStyle(
                                color: text_color,
                                fontFamily: 'quran',
                                fontSize: mushafFontSize),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      arabicFontSize = 28;
                                      mushafFontSize = 40;
                                    });
                                    saveSettings();
                                  },
                                  child: const Text('اعادة تعيين الاعدادات')),
                              ElevatedButton(
                                  onPressed: () {
                                    saveSettings();
                                  },
                                  child: const Text('حفظ')),
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
              ]),
        ],
        darkTheme: SettingsThemeData(
          settingsListBackground: backgraundcolor,
        ),
      ),
    );
  }
}
