import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/file_manager.dart';
import 'package:movies_app_flutter/widgets/custom_loading_spin_kit_ring.dart';
import 'package:sizer/sizer.dart';

import '../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color? mainColor;
  String? text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    () async {
      mainColor = await currentTheme();
      setState(() {
        text = kSplashScreenTitleText;
      });
    }();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomLoadingSpinKitRing(loadingColor: mainColor),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0.h),
                    child: Center(
                      child: Text(text ?? "", style: kSplashScreenTextStyle),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
