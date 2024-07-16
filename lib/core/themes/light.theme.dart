import 'package:camionesm/core/themes/text.theme.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';



final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor:  Globals.backGroundColor,
    sliderTheme: const SliderThemeData(activeTrackColor: Colors.white),
    primaryColor: Globals.principalColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Globals.principalColor),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
        backgroundColor: Globals.backGroundColor,
        surfaceTintColor: Globals.backGroundColor),
    dividerTheme: const DividerThemeData(color: Colors.black),
  textTheme: CustomTextStyles()
);