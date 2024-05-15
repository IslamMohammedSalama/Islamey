import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:islamey/core/constants.dart';
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        ListTile(
          trailing: const Icon(
            Icons.share,
            color: Colors.red,
          ),
          title: const Text(
            'مشاركة',textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.red),
          ),
          onTap: () {
            Share.share(
                '''اسلامي \n اسلامي هو تطبيق تم تطويره من قبل اسلام محمد سلامة \n https://github.com/IslamMohammedSalama''');
            Navigator.pop(context);
          },
        ),
        ListTile(
          trailing: const Icon(
            Icons.rate_review,
            color: Colors.green,
          ),
          title: const Text(

            'تقييم التطبيق',
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.green),
          ),
          onTap: () async {
            if (!await launchUrl(
                Uri.parse('https://github.com/IslamMohammedSalama'),
                mode: LaunchMode.externalApplication)) {
              throw 'Could not launch https://github.com/IslamMohammedSalama';
            }
          },
        ),
        Text(
          '''اسلامي \n اسلامي هو تطبيق تم تطويره من قبل اسلام محمد سلامة ''',
          style: TextStyle(
              color: text_color,
              fontFamily: "IBMPlexSansArabic-Thin",
              fontSize: 20,
              fontWeight: FontWeight.w900),
          textDirection: TextDirection.rtl,
        ),
        TextButton(
          onPressed: () async {
            if (!await launchUrl(
                Uri.parse(
                    'https://github.com/IslamMohammedSalama/islamey'),
                mode: LaunchMode.externalApplication)) {
              throw 'Could not launch https://github.com/IslamMohammedSalama/islamey';
            }
          },
          child:  Text(
            'رابط المشروع :  https://github.com/IslamMohammedSalama/islamey',
            style :TextStyle(
              color: text_color,
                fontFamily: "IBMPlexSansArabic-Thin",
                fontSize: 20,
                fontWeight: FontWeight.w900),
            textDirection: TextDirection.rtl,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  if (!await launchUrl(
                      Uri.parse(
                          'https://www.facebook.com/profile.php?id=61559104063980'),
                      mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch https://www.facebook.com/profile.php?id=61559104063980';
                  }
                },
                icon: const Icon(Icons.facebook)),
            IconButton(
                onPressed: () async {
                  if (!await launchUrl(
                      Uri.parse('https://github.com/IslamMohammedSalama'),
                      mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch https://github.com/IslamMohammedSalama';
                  }
                },
                icon: const ImageIcon(
                    AssetImage('assets/icons/github.png'))),
            IconButton(
                onPressed: () async {
                  if (!await launchUrl(
                      Uri.parse('https://twitter.com/IslamMoham41062'),
                      mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch https://twitter.com/IslamMoham41062';
                  }
                },
                icon: const ImageIcon(
                    AssetImage('assets/icons/twitter.png'))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icons/dart_icon.png",width: 30,height: 30),
             Text("&",
              style :TextStyle(
                  fontFamily: "IBMPlexSansArabic-Thin",
                  fontSize: 20,
                  color: text_color,
                  fontWeight: FontWeight.w900),
            ),const FlutterLogo(size: 30,),
            Text(
              " صنع باستخدام Dart & flutter  ",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontFamily: "IBMPlexSansArabic-Thin",
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: text_color),
            )
          ],
        )
      ],
    );
  }
}
