import 'package:islamey/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'settings.dart';

import 'constant.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgraundcolor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: backgraundcolor,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/quran.png',
                  height: 80,
                ),
                Text(
                  'القران',
                  style: TextStyle(fontSize: 20, color: text_color),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: text_color,
            ),
            title: Text(
              'الاعدادات',
              style: TextStyle(color: text_color),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: Colors.red,
            ),
            title: const Text(
              'مشاركة',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Share.share('''*Quran app*\n
u can develop it from my github github.com/itsherifahmed ''');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.rate_review,
              color: Colors.green,
            ),
            title: const Text(
              'تقييم التطبيق',
              style: TextStyle(color: Colors.green),
            ),
            onTap: () async {
              if (!await launchUrl(quranAppurl,
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $quranAppurl';
              }
            },
          ),
        ],
      ),
    );
  }
}
