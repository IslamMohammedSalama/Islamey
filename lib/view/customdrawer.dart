import 'package:flutter/material.dart';
import 'package:islamey/core/constants.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel : "بسيلسيبل",
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
           Radius.circular(0),

        )
      ),
      width: 250,
      backgroundColor: backgraundcolor,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                
                trailing: const ImageIcon(
                AssetImage(
                  'assets/icons/zkr.png',
                ),
                size: 25,
              ),
                title: Text(
                  'الازكار',
                  style: TextStyle(color: text_color),
                ),
                onTap: () {
                  setState(() {
                    selected_index = 0;pageController.animateToPage(selected_index,duration:const Duration(milliseconds: 750,),curve: Curves.easeIn);
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                trailing:  const ImageIcon(
                AssetImage(
                  'assets/icons/moshaf.png',
                ),
                size: 25,
              ),
                title: Text(
                  'القران الكريم',
                  style: TextStyle(color: text_color),
                ),
                onTap: () {
                  setState(() {
                    selected_index = 1;
                    pageController.animateToPage(selected_index,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeIn);
                  });
                  
                  Navigator.pop(context);
                },
              ),
              ListTile(
                trailing: const ImageIcon(
                  AssetImage(
                    'assets/icons/spha.png',
                  ),
                  size: 25,
                ),
                title: Text(
                  'السبحة',
                  style: TextStyle(color: text_color),
                ),
                onTap: () {
                  setState(() {
                    selected_index = 2;
                    pageController.animateToPage(selected_index,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeIn);
                  });
                  
                
                  Navigator.pop(context);

                },
              ),
              ListTile(
                trailing:const ImageIcon(
                  AssetImage(
                    'assets/icons/sala.png',
                  ),
                  size: 25,
                ),
                title: Text(
                  ' مواقيت الصلاة',
                  style: TextStyle(color: text_color),
                ),
                onTap: () {
                  setState(() {
                    selected_index = 3;
                    pageController.animateToPage(selected_index,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeIn);
                  });
                  
                  Navigator.pop(context);
                },
              ),
              ListTile(
                trailing: const Icon(Icons.settings),
                title: Text(
                  'الاعدادات',
                  style: TextStyle(color: text_color),
                ),
                onTap: () {
                   setState(() {
                    selected_index = 4;
                    pageController.animateToPage(selected_index,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeIn);
                  });
                  
                  Navigator.pop(context);
                },
              ),
              ListTile(
                trailing: const Icon(Icons.info),
                title: Text(
                  'عنا',
                  style: TextStyle(color: text_color),
                ),
                onTap: () {
                  setState(() {
                    selected_index = 5;
                    pageController.animateToPage(selected_index,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeIn);
                  });
                  
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
