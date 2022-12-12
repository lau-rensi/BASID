import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSmallText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppSmallText({Key? key,
    this.size = 16,
    required this.text,
    this.color=Colors.black54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: GoogleFonts.robotoSerif(
            color:color,
            fontSize: size
        )
    );
  }
}
