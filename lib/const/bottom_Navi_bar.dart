import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/colors.dart';
import 'package:yoga_trainer_app/pages/Home%20page/home_page.dart';
import 'package:yoga_trainer_app/pages/Notification%20page/natification_page.dart';
import 'package:yoga_trainer_app/pages/Profile%20page/profile_page.dart';
import 'package:yoga_trainer_app/pages/Blog%20page/blogpage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;
  final items = <Widget>[
    const Icon(
      Icons.home,
      size: 24,
    ),
    const Icon(
      Icons.read_more,
      size: 24,
    ),
    const Icon(
      Icons.notifications,
      size: 24,
    ),
    const Icon(
      Icons.person,
      size: 24,
    ),
  ];

  final screens = [
    const HomePage(),
    const Blog_Page(),
    const Notification_Page(),
    const Profile_Page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(
            color: maincolor,
          ),
        ),
        child: CurvedNavigationBar(
          color: secondcolor,
          index: index,
          backgroundColor: Colors.transparent,
          height: 50,
          items: items,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }
}
