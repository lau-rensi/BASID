import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:basid_2022/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../navpages/navbar.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Image.asset('assets/images/logo-basid-2.png'),
            SizedBox(height: 50),
            RichText(text: TextSpan(
                text: "supported by ",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18
                ),
                children: [
                  TextSpan(
                      text: " CLENRO",
                      style: TextStyle(
                          color: Color(0xFF43A838),
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      )
                  )
                ]
            ))
          ],
        ),
        backgroundColor: Color(0xFFF9F9F9),
        splashIconSize: 600,
        duration: 4000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: NavBar(),);
  }
}
