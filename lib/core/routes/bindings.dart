import 'package:camionesm/app/pages/detail/driver/detail_driver.controller.dart';
import 'package:camionesm/app/pages/detail/petition/detail_petition.controller.dart';
import 'package:camionesm/app/pages/detail/transport/detail_transport.controller.dart';
import 'package:camionesm/app/pages/detail/trips/detail_trips.controller.dart';
import 'package:camionesm/app/pages/detail/truck/detail_truck.controller.dart';
import 'package:camionesm/app/pages/drivers/drivers.controller.dart';
import 'package:camionesm/app/pages/drivers/register/driver_register.controller.dart';
import 'package:camionesm/app/pages/earnings/eanings.controller.dart';
import 'package:camionesm/app/pages/invoice/invoice.controller.dart';
import 'package:camionesm/app/pages/login/login.controller.dart';
import 'package:camionesm/app/pages/nav/items/home/home.controller.dart';
import 'package:camionesm/app/pages/nav/items/petitions/petitions.controller.dart';
import 'package:camionesm/app/pages/nav/items/settings/settings.controller.dart';
import 'package:camionesm/app/pages/nav/items/trips/register/trip_register.controller.dart';
import 'package:camionesm/app/pages/nav/items/trips/trips.controller.dart';
import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register.controller.dart';
import 'package:camionesm/app/pages/nav/items/truks/trucks.controller.dart';
import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/app/pages/profile/profile.controller.dart';
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
class NavBarBinding implements Bindings  {
  final ICountryService iCountryService;

  NavBarBinding(this.iCountryService);
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<HomeController>(() => HomeController(iCountryService),fenix: true);

    Get.lazyPut<PetitionsController>(() => PetitionsController(),fenix: true);

    Get.lazyPut<TrucksController>(()=> TrucksController(), fenix: true);
    Get.lazyPut<TrucksRegisterController>(() => TrucksRegisterController(),fenix: true);

    Get.lazyPut<TripsController>(() => TripsController(),fenix: true);
    Get.lazyPut<TripRegisterController>(() => TripRegisterController(iCountryService),fenix: true);

    Get.lazyPut<SettingsController>(() => SettingsController(),fenix: true);
  }

}

class DetailTransportBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<DetailTransportController>(()=> DetailTransportController());
  }

}
class DetailTruckBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<DetailTruckController>(()=> DetailTruckController());
  }

}
class DetailDriverBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<DetailDriverController>(()=> DetailDriverController());
  }

}
class DetailTripsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailTripsController>(()=> DetailTripsController());
  }

}
class DetailPetitionBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailPetitionController>(()=> DetailPetitionController());
  }

}

class DriversBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<DriversController>(()=> DriversController());
    Get.lazyPut<DriverRegisterController>(()=> DriverRegisterController());
  }

}
class ProfileBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(()=> ProfileController());
  }

}
class InvoiceBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<InvoiceController>(()=> InvoiceController());
  }

}
class EarningsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EarningsController>(()=> EarningsController());
  }
}

