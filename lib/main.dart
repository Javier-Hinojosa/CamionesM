import 'package:camionesm/app/pages/login/login.page.dart';
import 'package:camionesm/app/pages/splash_screen/splash_screen.page.dart';
import 'package:camionesm/core/routes/bindings.dart';
import 'package:camionesm/core/routes/pages.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/themes/light.theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     /*localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,*/
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: Routes.splashScreen,
      defaultTransition: Transition.cupertino,
      initialBinding: SplashScreenBinding(),
      getPages: Pages.pages,
      home: const SplashScreenPage(),
    );
  }
}