import 'package:camionesm/app/pages/login/login.controller.dart';
import 'package:camionesm/app/pages/nav/home/home.controller.dart';
import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/app/pages/nav/petitions/petitions.controller.dart';
import 'package:camionesm/app/pages/nav/settings/settings.controller.dart';
import 'package:camionesm/app/pages/nav/trips/trips.controller.dart';
import 'package:camionesm/app/pages/nav/truks/truck.controller.dart';
import 'package:camionesm/app/pages/signup/registers/access_data/access_data.controller.dart';
import 'package:camionesm/app/pages/signup/registers/general_data/general_data.controller.dart';
import 'package:camionesm/app/pages/signup/registers/legal_representative/legal_representative.controller.dart';
import 'package:camionesm/app/pages/signup/registers/residence_fiscal/residence_fiscal.Controller.dart';
import 'package:camionesm/app/pages/signup/signup.controller.dart';
import 'package:camionesm/app/pages/splash_screen/splash_screen.controller.dart';
import 'package:camionesm/data/services/country/country.contract.dart';
import 'package:get/get.dart';


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}

class SingUpBinding implements Bindings {

  final ICountryService iCountryService;

  SingUpBinding(this.iCountryService);
  @override
  void dependencies() {
    Get.lazyPut<SingUpController>(()=> SingUpController());
    Get.lazyPut<GeneralDataController>(()=> GeneralDataController(),fenix: true);
    Get.lazyPut<ResidenceFiscalController>(()=> ResidenceFiscalController(iCountryService),fenix: true);
    Get.lazyPut<LegalRepresentativeController>(()=> LegalRepresentativeController(),fenix: true);
    Get.lazyPut<AccessDataController>(()=> AccessDataController(),fenix: true);
  }
}

class NavBarBinding implements Bindings {
  final ICountryService iCountryService;

  NavBarBinding(this.iCountryService);
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<HomeController>(() => HomeController(iCountryService),fenix: true);
    Get.lazyPut<PetitionsController>(() => PetitionsController(),fenix: true);
    Get.lazyPut<TrucksController>(() => TrucksController(),fenix: true);
    Get.lazyPut<TripsController>(() => TripsController(),fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(),fenix: true);
  }
}

