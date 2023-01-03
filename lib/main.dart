import 'package:basid_2022/navpages/home_page.dart';
import 'package:basid_2022/navpages/navbar.dart';
import 'package:basid_2022/navpages/profile_page.dart';
import 'package:basid_2022/pages/about_garbage.dart';
import 'package:basid_2022/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BASID',
      home: SplashScreen(),
    );
  }
}

