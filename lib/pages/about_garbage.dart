import 'package:basid_2022/animations/slide_animation.dart';
import 'package:basid_2022/navpages/navbar.dart';
import 'package:basid_2022/widgets/AppLargeText.dart';
import 'package:basid_2022/widgets/AppSmallText.dart';
import 'package:basid_2022/widgets/DescriptionText.dart';
import 'package:basid_2022/widgets/app_button.dart';
import 'package:basid_2022/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
//ended at 2:40:20.
class AboutGarbage extends StatefulWidget {
  const AboutGarbage({Key? key}) : super(key: key);
//about Garbage waste
  @override
  State<AboutGarbage> createState() => _AboutGarbageState();
}

class _AboutGarbageState extends State<AboutGarbage> {
  int threatLevel=4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          AppLargeText(text: "Garbage", color: Colors.black.withOpacity(0.8))
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          AppSmallText(text: "Threat Level", color: Colors.black54,size: 18,)
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index){
                              return Icon(Icons.star, color:index<threatLevel?Colors.red:Colors.black54,size: 16,);
                            }),
                          ),
                          SizedBox(width: 10),
                          AppSmallText(text: "(4.0)", color: Colors.black54, size: 14)
                        ],
                      ),
                      SizedBox(height: 25),
                      AppLargeText(text: "Description", color: Colors.black.withOpacity(0.8), size: 20,),
                      SizedBox(height: 10),
                      DescriptionText(
                          text: "This refers to animal and vegetable wastes resulting from the handling, sale, storage, preparation, cooking and serving of food. Garbage comprising these wastes contains putrescible (rotting) organic matter, which produces an obnoxious odor and attracts rats and other vermin. It, therefore, requires special attention in storage, handling and disposal.")

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
