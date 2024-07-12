import 'package:camionesm/core/themes/text.theme.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff1f0f0),
    primaryColor: const Color(0xfff6c700),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xfff6c700)),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xfff1f0f0)),
    dividerTheme: const DividerThemeData(color: Colors.black),
  textTheme: CustomTextStyles()
);