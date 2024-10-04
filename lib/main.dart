import 'package:camionesm/app/pages/splash_screen/splash_screen.page.dart';
import 'package:camionesm/core/routes/bindings.dart';
import 'package:camionesm/core/routes/pages.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/themes/light.theme.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/data/services/user/user.services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(Globals.currentLocaleComplete, null);

  SystemChrome.setPreferredOrientations([ //only vertical orientation
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale(Globals.currentLocale, Globals.currentCountry),
     // localizationsDelegates: context.localizationDelegates,
     // supportedLocales: context.supportedLocales,
      //locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: Routes.splash,
      defaultTransition: Transition.cupertino,
      initialBinding: SplashScreenBinding(UserApiService()),
      getPages: Pages.pages,
      home: const SplashScreenPage()
    );
  }
}