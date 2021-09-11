import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utils/constants.dart';

class CustomMoviesButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final EdgeInsetsGeometry? padding;

  CustomMoviesButton({
    required this.text,
    this.onPressed,
    required this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.0.sp), color: color),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 1.5.h),
            child: Center(child: Text(text, style: kHomeScreenButtonTextStyle)),
          ),
        ),
      ),
    );
  }
}
