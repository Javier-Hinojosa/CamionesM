import 'package:camionesm/data/models/items/check.item.dart';
import 'package:get/get.dart';

class TrucksController extends GetxController{

final isRegister = false.obs;

final trucksFilter= <CheckItem>[
  CheckItem("Recién Agregados"),
  CheckItem("Modelo"),
  CheckItem("Año"),
  CheckItem("Tipo de camión"),
  CheckItem("Tipo de carga")
].obs;






}