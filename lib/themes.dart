import 'package:flutter/material.dart';
import 'const.dart';

final kLightTheme = ThemeData(
  scaffoldBackgroundColor: kScaffoldLightColor,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
    backgroundColor: kScaffoldLightColor,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: kScaffoldLightColor,
    indicatorColor: kAddToCartButtonColor.withOpacity(0.5),
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
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
    backgroundColor: kScaffoldDarkColor,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: kScaffoldDarkColor,
    indicatorColor: kAddToCartButtonColor.withOpacity(0.5),
    labelTextStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

final kDarkMaterial3Theme = ThemeData(
  useMaterial3: true, brightness: Brightness.dark,
  //colorSchemeSeed: Colors.green,
);

final kLightMaterial3Theme = ThemeData(
  useMaterial3: true,
  //colorSchemeSeed: Colors.green,
);
