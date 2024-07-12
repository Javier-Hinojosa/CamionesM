import 'package:flutter/material.dart';

class CustomTextStyles extends TextTheme {

  @override
  TextStyle? get bodyLarge => null;

  @override
  TextStyle? get bodyMedium => null;

  @override
  TextStyle? get bodySmall => null;

  @override
  TextStyle? get displayLarge => null;

  @override
  TextStyle? get displayMedium => null;

  @override
  TextStyle? get displaySmall => null;

  @override
  TextStyle? get headlineLarge => null;

  @override
  TextStyle? get headlineMedium => null;

  @override
  TextStyle? get headlineSmall => null;

  @override
  TextStyle? get labelLarge => null;

  @override
  TextStyle? get labelMedium => null;

  @override
  TextStyle? get labelSmall => null;

  @override
  TextStyle? get titleSmall => null;

  @override
  TextStyle? get titleLarge => const TextStyle(fontSize: 32, color: Colors.black,fontWeight: FontWeight.bold);

  @override
  TextStyle? get titleMedium => const TextStyle(fontSize: 18, color: Colors.black);
}