import 'package:Islamey/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        SizedBox(
          height: 100,
          child: ListView(
            children: [
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
                  Share.share(
                      '''اسلامي \n اسلامي هو تطبيق تم تطويره من قبل اسلام محمد سلامة \n https://github.com/Islam394/Islamey''');
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
                  if (!await launchUrl(
                      Uri.parse('https://github.com/Islam394/Islamey'),
                      mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch https://github.com/Islam394/Islamey';
                  }
                },
              ),
              Text(
                '''اسلامي \n اسلامي هو تطبيق تم تطويره من قبل اسلام محمد سلامة ''',
                style: TextStyle(color: text_color, fontSize: 20),
                textDirection: TextDirection.rtl,
              ),
              TextButton(
                  onPressed: () async {
                    if (!await launchUrl(
                        Uri.parse('https://github.com/Islam394/Islamey'),
                        mode: LaunchMode.externalApplication)) {
                      throw 'Could not launch https://github.com/Islam394/Islamey';
                    }
                  },
                  child: const Text(
                      'رابط المشروع :  https://github.com/Islam394/Islamey',textDirection: TextDirection.rtl,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        if (!await launchUrl(
                            Uri.parse(
                                'https://www.facebook.com/profile.php?id=61555736083117'),
                            mode: LaunchMode.externalApplication)) {
                          throw 'Could not launch https://www.facebook.com/profile.php?id=61555736083117';
                        }
                      },
                      icon: const Icon(Icons.facebook)),
                  IconButton(
                      onPressed: () async {
                        if (!await launchUrl(
                            Uri.parse('https://github.com/Islam394'),
                            mode: LaunchMode.externalApplication)) {
                          throw 'Could not launch https://github.com/Islam394';
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
