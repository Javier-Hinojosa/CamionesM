import 'package:camionesm/app/pages/detail/driver/detail_driver.page.dart';
import 'package:camionesm/app/pages/detail/transport/detail_transport.page.dart';
import 'package:camionesm/app/pages/detail/truck/detail_truck.page.dart';
import 'package:camionesm/app/pages/drivers/drivers.page.dart';
import 'package:camionesm/app/pages/login/login.page.dart';
import 'package:camionesm/app/pages/nav/nav_bar.page.dart';
import 'package:camionesm/app/pages/profile/profile.page.dart';
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
        name: Routes.navBar,
        page: () =>  const NavBarPage(),
        binding: NavBarBinding(countryApiService)),
    GetPage(
      name: Routes.detailTransport,
      page: ()=> const DetailTransportPage(),
      binding: DetailTransportBinding()),
    GetPage(
        name: Routes.detailTruck,
        page: ()=> const DetailTruckPage(),
        binding: DetailTruckBinding()),
    GetPage(
        name: Routes.profile,
        page: ()=> const ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.drivers,
        page: ()=> const DriversPage(),
        binding: DriversBinding()),
    GetPage(
        name: Routes.detailDriver,
        page: ()=> const DetailDriverPage(),
        binding: DetailDriverBinding())
  ];
}
