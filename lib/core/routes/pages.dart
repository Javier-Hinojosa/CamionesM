import 'package:camionesm/app/pages/login/login.page.dart';
import 'package:camionesm/app/pages/splash_screen/splash_screen.page.dart';
import 'package:camionesm/core/routes/bindings.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:get/get.dart';

abstract class Pages {
  static final pages = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreenPage(),
        binding: SplashScreenBinding()),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(seconds: 1, milliseconds: 500),
    ),
    GetPage(
        name: Routes.signUp,
        page: () => const SplashScreenPage(),
        binding: SplashScreenBinding()),
    GetPage(
        name: Routes.home,
        page: () => const SplashScreenPage(),
        binding: SplashScreenBinding()),
  ];
}
