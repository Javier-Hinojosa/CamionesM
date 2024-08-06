import 'package:camionesm/core/values/paths.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{

  final controllerCarrousel = CarouselController().obs;
  final indexCarrousel= 0.obs;
  final mapController= MapController().obs;
  final List<String> registerSends=List.of({"A-101","B-105","C-505","D-605"});
  final RxString selectedSend="A-101".obs;

  final List<String> imgList = [
    Paths.papers,
    'assets/images/carrousel.png',
    'assets/images/map.png',
    'assets/images/truck1.png',
  ];

  void fitBounds(LatLngBounds bounds) {
    mapController().fitCamera(CameraFit.bounds(padding:const EdgeInsets.all(20.0), bounds: bounds));
  }

}