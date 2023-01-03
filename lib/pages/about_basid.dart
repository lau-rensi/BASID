import 'package:basid_2022/animations/slide_animation.dart';
import 'package:basid_2022/navpages/navbar.dart';
import 'package:basid_2022/widgets/AppLargeText.dart';
import 'package:basid_2022/widgets/DescriptionText.dart';
import 'package:basid_2022/widgets/app_button.dart';
import 'package:basid_2022/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
//ended at 2:40:20.
class AboutBasid extends StatefulWidget {
  const AboutBasid({Key? key}) : super(key: key);

  @override
  State<AboutBasid> createState() => _AboutBasidState();
}

class _AboutBasidState extends State<AboutBasid> {
  int threatLevel=4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/pictureit.png"),
                          fit: BoxFit.cover
                      )
                  ),
                )),
            Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20,right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: "About Basid", color: Colors.black.withOpacity(0.8))
                        ],
                      ),
                      SizedBox(height: 10),
                      DescriptionText(
                          text: "This study aims to design and develop an application for monitoring solid waste that helps the citizen science community in making relevant policies and programs to combat solid waste issues for the betterment of the community.")

                    ],
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            SlideRightRoute(page: NavBar()));
                      },
                      child: AppButtons(
                          textColor: Color(0xFF339C84),
                          backgroundColor: Colors.white,
                          borderColor: Color(0xFF339C84),
                          text: "Home",
                          size: 60),
                    ),
                    SizedBox(width: 20),
                    AppResponsiveButtons(isResponsive: true,)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
