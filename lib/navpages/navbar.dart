import 'package:basid_2022/navpages/camera_page.dart';
import 'package:basid_2022/navpages/home_page.dart';
import 'package:basid_2022/navpages/profile_page.dart';
import 'package:basid_2022/navpages/settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens =[
    HomePage(),
    ProfilePage(),
    CameraPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
        backgroundColor: Color(0xFFF9F9F9),
        bottomNavigationBar: CurvedNavigationBar(
        index: index,
          animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Color(0xFFF9F9F9),
        color: Color(0xFF339C84),
        buttonBackgroundColor: Color(0xFF43A838),
        items: [
          Icon(Icons.home,
          color: Color(0xFFF9F9F9),
            size: 25,
          ),
          Icon(Icons.person,
            color: Color(0xFFF9F9F9),
            size: 25,),
          Icon(Icons.camera_alt_outlined,
            color: Color(0xFFF9F9F9),
            size: 25,
          ),
          Icon(Icons.settings,
            color: Color(0xFFF9F9F9),
            size: 25,),
        ],
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
