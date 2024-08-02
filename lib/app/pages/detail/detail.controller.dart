import 'package:camionesm/core/values/paths.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{

  final controllerCarrousel = CarouselController().obs;
  final indexCarrousel= 0.obs;

  final List<String> imgList = [
    Paths.papers,
    'assets/images/carrousel.png',
    'assets/images/map.png',
    'assets/images/truck1.png',
  ];


}