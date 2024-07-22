import 'package:camionesm/app/pages/login/login.page.dart';
import 'package:camionesm/app/pages/signup/signup.page.dart';
import 'package:camionesm/app/pages/splash_screen/splash_screen.page.dart';
import 'package:camionesm/core/routes/bindings.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/data/services/country/country.services.dart';
import 'package:get/get.dart';

abstract class Pages {

  static final countryApiService = CountryApiService();

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
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
        name: Routes.singUp,
        page: ()=>const SingUpPage(),
    binding: SingUpBinding(countryApiService)),
    GetPage(
        name: Routes.home,
        page: () => const SplashScreenPage(),
        binding: SplashScreenBinding()),
  ];
}
