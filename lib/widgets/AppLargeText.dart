import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
   AppLargeText({Key? key,
     this.size = 28,
     required this.text,
     this.color=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
  text,
      style: GoogleFonts.robotoSerif(
        color:Color(0xFF43A838),
        fontSize: size,
        fontWeight: FontWeight.w500,
          letterSpacing: 0.1
      )
    );
  }
}
