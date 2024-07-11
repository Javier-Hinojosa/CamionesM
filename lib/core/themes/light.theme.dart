import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff6c700),
    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xfff6c700)),
    useMaterial3: true,
    dividerTheme: const DividerThemeData(color: Colors.black),
  textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 32, color: Colors.black,fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 18, color: Colors.black)
  )
);