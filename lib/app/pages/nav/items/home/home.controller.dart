import 'package:camionesm/app/pages/nav/items/home/home_filter.controller.dart';
import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/data/models/models/auth.model.dart';
import 'package:camionesm/data/models/services/profile_user.service.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends HomeFilterController{

  final enableNotification = true.obs;
  final isHomeView=true.obs;
  static const List<LatLng> points= Globals.points;
  final mapController= MapController().obs;

  late final AuthUserModel userData;
  late final bool isLogged;

  HomeController(super.iCountryService){
    final ProfileUserService tempDataService = ProfileUserService();
    print(tempDataService.isLogged);
    isLogged=tempDataService.isLogged;
    userData=tempDataService.userModel;
  }

  @override
  void onInit() {
    super.onInit();


  }

  resetController(){
    Get.reset();
  }

  @override
  void onReady() {
    super.onReady();
  }





}