import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/items/profile.item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController with GetSingleTickerProviderStateMixin{
  final loading = true.obs;
  final enableNotification = true.obs;
  final lightTheme=true.obs;

  static final List<ProfileItem> profileItems = [
    ProfileItem(ProfileItems.myCars,FontAwesomeIcons.truckField,"Mis vehículos",haveNotification: true),
    ProfileItem(ProfileItems.myDrivers,Icons.group_outlined,"Mis conductores",haveNotification: true),
    ProfileItem(ProfileItems.registerNewTrip,Icons.assignment_add,"Registrar nuevo viaje"),
    ProfileItem(ProfileItems.myTrips,FontAwesomeIcons.flag,"Mis viajes"),
    ProfileItem(ProfileItems.solicitudes,FontAwesomeIcons.envelope,"Solicitudes"),
    ProfileItem(ProfileItems.myEarnings,Icons.payments_outlined,"Mis ganancias")
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