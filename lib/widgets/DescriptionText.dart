import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  DescriptionText({Key? key,
    this.size = 14,
    required this.text,
    this.color=Colors.black54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.justify,
        text,
        style: TextStyle(
            color:color,
            fontSize: size,
            height: 1.5,
        )
    );
  }
}
