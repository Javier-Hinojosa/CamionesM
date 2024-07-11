import 'package:camionesm/app/pages/login/login.page.dart';
import 'package:camionesm/core/themes/light.theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home:  const LoginPage(),
    );
  }
}