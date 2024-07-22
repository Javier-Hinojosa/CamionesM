
import 'package:camionesm/app/pages/login/login.controller.dart';
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

