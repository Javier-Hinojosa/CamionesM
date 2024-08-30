import 'package:camionesm/app/pages/nav/items/petitions/petitons_list.page.dart';
import 'package:camionesm/app/pages/nav/items/trips/register/trip_register_general.page.dart';
import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/items/generic.item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController with GetSingleTickerProviderStateMixin{
  final loading = true.obs;
  final enableNotification = true.obs;
  final lightTheme=true.obs;

  static final List<GenericItem> profileItems = [
    GenericItem(ProfileItems.myCars,FontAwesomeIcons.truckField,"Mis vehículos",haveNotification: true,onPressed: ()=> Get.find<NavBarController>().onItemTapped(2)),
    GenericItem(ProfileItems.myDrivers,Icons.group_outlined,"Mis conductores",haveNotification: true,onPressed:()=> Get.toNamed(Routes.drivers)),
    GenericItem(ProfileItems.registerNewTrip,Icons.assignment_add,"Registrar nuevo viaje",onPressed: ()=> Get.to(()=>const TripRegisterGeneralPage())),
    GenericItem(ProfileItems.myTrips,FontAwesomeIcons.flag,"Mis viajes",onPressed: ()=> Get.find<NavBarController>().onItemTapped(3)),
    GenericItem(ProfileItems.solicitudes,FontAwesomeIcons.envelope,"Solicitudes",onPressed: ()=> Get.to(()=>const PetitionsListPage())),
    GenericItem(ProfileItems.myEarnings,Icons.payments_outlined,"Mis ganancias",onPressed: ()=>Get.toNamed(Routes.earnings))
  ];

  @override
  void onInit() {
    super.onInit();
    loading(false);
  }

  onSelectProfileItem(ProfileItems id) {
  }

  onChangeMode() {
    print('eee');
    lightTheme(!lightTheme());
    print(lightTheme());
  }


}