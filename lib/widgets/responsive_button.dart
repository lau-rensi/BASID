import 'package:basid_2022/animations/slide_animation.dart';
import 'package:basid_2022/navpages/camera_page.dart';
import 'package:basid_2022/widgets/AppSmallText.dart';
import 'package:flutter/material.dart';


class AppResponsiveButtons extends StatelessWidget {
  bool? isResponsive;
  double? width;

  AppResponsiveButtons({Key? key,
  this.width = 100,
  this.isResponsive=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                SlideRightRoute(page: CameraPage()));
          },
          child: Container(
            height: 60,
            width: isResponsive==true?double.maxFinite:width,
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF43A838)
            ),
            child: Row(
              mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
              children: [
                isResponsive==true?AppSmallText(text: "Make a report",
                color: Colors.white):Container(),
                Icon(Icons.newspaper, size: 40, color: Colors.white)
              ],
            ),
          ),
        ));
  }
}
