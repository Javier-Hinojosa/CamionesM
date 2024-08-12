import 'package:camionesm/core/themes/text_style.theme.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';



final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Globals.backgroundColor,
    cardColor: Colors.black,
    sliderTheme: const SliderThemeData(activeTrackColor: Colors.white),
    primaryColor: Globals.principalColor,
    dividerColor: Globals.backgroundColor,
    canvasColor: Colors.grey.shade300,
    primaryColorDark: Colors.black45,
    iconTheme: const IconThemeData(color: Colors.white70),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.black,
        linearMinHeight: 5,
        refreshBackgroundColor: Colors.black
    ),
    iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: WidgetStateProperty.all<Color>(Colors.white70))),
    colorScheme: ColorScheme.fromSeed(
        surface: Colors.white,
        seedColor: Globals.principalColor),
    dividerTheme: const DividerThemeData(color: Colors.black),
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
    inputDecorationTheme: const InputDecorationTheme(
        disabledBorder: UnderlineInputBorder(),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(style: BorderStyle.solid))),
    appBarTheme: const AppBarTheme(
    backgroundColor: Globals.backgroundColor,
    surfaceTintColor: Globals.backgroundColor),
    textTheme: CustomTextStyles()
);