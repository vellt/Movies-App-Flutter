import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class CustomLoadingSpinKitRing extends StatelessWidget {
  final Color? loadingColor;

  CustomLoadingSpinKitRing({
    required this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Icon(
            Icons.videocam,
            size: 20.0.sp,
            color: loadingColor ?? Colors.transparent,
          ),
        ),
        SpinKitRing(
          color: loadingColor ?? Colors.transparent,
          size: 50.0.sp,
          lineWidth: 2.0.sp,
        ),
      ],
    );
  }
}
