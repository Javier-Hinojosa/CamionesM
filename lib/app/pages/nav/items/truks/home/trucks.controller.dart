import 'package:camionesm/data/models/items/filter.item.dart';
import 'package:get/get.dart';

class TrucksController extends GetxController{

final isRegister = false.obs;

final trucksFilter= <FilterItem>[
  FilterItem("Recién Agregados"),
  FilterItem("Modelo"),
  FilterItem("Año"),
  FilterItem("Tipo de camión"),
  FilterItem("Tipo de carga")
].obs;






}