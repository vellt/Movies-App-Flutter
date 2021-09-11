import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColoredCircle extends StatelessWidget {
  final Color color;
  final Function(Color) onPressed;

  ColoredCircle({required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(color);
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: 3.h,
      ),
    );
  }
}
