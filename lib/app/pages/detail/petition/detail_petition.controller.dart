import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/items/map_controller.item.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DetailPetitionController extends GetxController{

  final mapController= MapControllerItem.empty().obs;
  final Rx<TypePetition> petitionsList= TypePetition.receives.obs;

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
      petitionsList.value = TypePetition.values.firstWhere(
              (e) => e.toString() == Get.parameters['type'], orElse: () => throw Exception('Invalid type'));
    } else {
      throw "No se ah asignado ningun tipo de pagina";
    }
  }


}