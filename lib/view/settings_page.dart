// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:Islamey/view/homepage.dart';
import 'package:Islamey/view/spha.dart';

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
                activeSwitchColor: Colors.blue,
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
