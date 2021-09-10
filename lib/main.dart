import 'package:flutter/material.dart';
import 'package:movies_app_flutter/screens/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'utils/constants.dart';
import 'screens/home_screen.dart';
import 'package:movies_app_flutter/widgets/movie_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.dark().copyWith(
            platform: TargetPlatform.iOS,
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kPrimaryColor,
          ),
          home: HomeScreen(
            key: kHomeScreenKey,
          ),
        );
      },
    );
  }
}
