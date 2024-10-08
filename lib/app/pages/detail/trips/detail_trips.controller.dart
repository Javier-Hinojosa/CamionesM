import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/items/map_controller.item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';


class DetailTripsController extends GetxController{

  final mapController= MapControllerItem.empty().obs;
  final Rx<TypeTrip> tripsList= TypeTrip.actives.obs;
  final Rx<bool> isEdit= false.obs;
  final textEditingPinLock = TextEditingController().obs;



  @override
  void onInit() {
    super.onInit();
    _assignPage();
    mapController(MapControllerItem(const LatLng(48.8566, 2.3522), const LatLng(48.8666, 2.3522)));
  }

  @override
  void onClose() {
    super.onClose();
    mapController().mapController.dispose();
    mapController.close();
  }

  void _assignPage(){
   if(Get.parameters.isNotEmpty){
     tripsList.value = TypeTrip.values.firstWhere(
             (e) => e.toString() == Get.parameters['type'],
         orElse: () => throw Exception('Invalid type'));
     if(Get.parameters['isEdit']!=null) {
       isEdit(bool.tryParse(Get.parameters['isEdit'].toString())??false);
     }
   }else {
     throw "No se ah asignado ningun tipo de pagina";
   }
  }

  IconData getIcon(){
    switch(tripsList()){
      case TypeTrip.actives: return Icons.history_toggle_off_outlined;
      case TypeTrip.inProgress:return Icons.sensors_outlined;
      case TypeTrip.historical:return Icons.book_outlined;
    }
  }
}