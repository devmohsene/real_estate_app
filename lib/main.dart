import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/screens/MainleveeTimelineScreen.dart';
import 'package:real_estate_app/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REal Estate',
      theme: ThemeData(
        primaryColor: COLOR_WHITE,
        // primaryColorDark: COLOR_WHITE,
        // primaryColorLight: COLOR_WHITE,
        accentColor: COLOR_DARK_BLUE,
        textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
      ),
      home: MainleveeTimelineScreen(),
    );
  }
}
