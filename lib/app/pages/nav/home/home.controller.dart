import 'package:camionesm/app/pages/nav/home/home_filter.controller.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends HomeFilterController {

  final enableNotification = true.obs;
  final loading = true.obs;
  final isHomeView=true.obs;
  static const List<LatLng> points= Globals.points;
  final mapController= MapController().obs;

  HomeController(super.iCountryService);

  @override
  void onReady() {
    super.onReady();
    loading(false);
  }





}