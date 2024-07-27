import 'package:camionesm/core/themes/text.theme.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';



final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor:  Globals.backGroundColor,
    sliderTheme: const SliderThemeData(activeTrackColor: Colors.white),
    primaryColor: Globals.principalColor,
    dividerColor: Globals.backGroundColor,
    iconTheme: const IconThemeData(color: Colors.white70),
    iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: WidgetStateProperty.all<Color>(Colors.white70))),
    chipTheme:   ChipThemeData(
          shape: const RoundedRectangleBorder(
              side: BorderSide(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(30)) ),
        backgroundColor: Globals.secondColor,
        labelStyle: CustomTextStyles().labelMedium!.apply(color: Colors.white),
        selectedColor: Globals.principalColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Globals.secondColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white ,
      unselectedItemColor: Colors.white54,
      elevation: 3,
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Colors.white54)
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Globals.principalColor),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: Globals.backGroundColor,
        surfaceTintColor: Globals.backGroundColor),
    dividerTheme: const DividerThemeData(color: Colors.black),
  textTheme: CustomTextStyles()
);