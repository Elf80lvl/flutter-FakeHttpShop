import 'package:flutter/material.dart';

import 'const.dart';

final kLightTheme = ThemeData(
  scaffoldBackgroundColor: kScaffoldLightColor,
  brightness: Brightness.light,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: kScaffoldLightColor,
    labelTextStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

final kDarkTheme = ThemeData(
  scaffoldBackgroundColor: kScaffoldDarkColor,
  brightness: Brightness.dark,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: kScaffoldDarkColor,
    labelTextStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
