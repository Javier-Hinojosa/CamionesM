
import 'package:camionesm/data/models/items/check.item.dart';
import 'package:get/get.dart';

class DriversController extends GetxController{

  final isRegister = false.obs;

  final trucksFilter= <CheckItem>[
    CheckItem("Recién Agregados"),
    CheckItem("Alfabéticamante"),
    CheckItem("Valoraciones"),
  ].obs;


}