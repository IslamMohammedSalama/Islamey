// ignore_for_file: unused_import
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:islamey/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:islamey/view/homepage.dart';
import 'package:islamey/view/spha.dart';

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
                activeSwitchColor: appcolor,
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
              SettingsTile.navigation(
                title: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appcolor,
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
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            backgroundColor: backgraundcolor,
                            title: Text(
                              "تخيير اللون المفضل",
                              style: TextStyle(color: text_color),
                            ),
                            content: SizedBox(
                              height: 300,
                              child: ListView(
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
                                        pickerColor: appcolor,
                                        useInShowDialog: true,
                                        onColorChanged:
                                            (Color selectedcolorfromavcolor) =>
                                                setState(() {
                                                  appcolor =
                                                      selectedcolorfromavcolor;
                                                })),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "اختر اللون",
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )));
                  },
                  child: Text("تغيير الللون المفضل ",
                      style: TextStyle(
                          fontFamily: "IBMPlexSansArabic-Thin",
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: text_color)),
                ),
              )
            ],
          ),
        ],
        darkTheme: SettingsThemeData(
          settingsListBackground: backgraundcolor,
        ),
      ),
    );
  }
}
