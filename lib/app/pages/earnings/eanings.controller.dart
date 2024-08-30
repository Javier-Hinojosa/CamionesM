import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/items/generic_check.item.dart';
import 'package:get/get.dart';

class EarningsController extends GetxController{

  final typeListTrips = [
    GenericCheck(TypePeriods.week, "Semanal", isSelect: true),
    GenericCheck(TypePeriods.quarterly, "Quincenal"),
    GenericCheck(TypePeriods.monthly, "Mensual"),
    GenericCheck(TypePeriods.fortnightly, "Trimestral"),
    GenericCheck(TypePeriods.annual, "Anual"),
  ].obs;


  onChangeListType(GenericCheck e) {
    for (var element in typeListTrips) {
      if(e==element){
        element.isSelect=true;
      }else {
        element.isSelect=false;
      }
    }
    typeListTrips.refresh();
  }

  void _listenOrderListType(){
    typeListTrips.listen((p0) {

      GenericCheck? selectedType;
      for (var element in p0) {
        if (element.isSelect) {
          selectedType = element;
        }
      }

      // Ordenar las columnas colocando la seleccionada al inicio
      if (selectedType != null) {
    /*    columns.sort((a, b) {
          // Si la columna coincide con el tipo seleccionado, colócala al inicio
          if (a.id == selectedType!.id) {
            return -1;
          } else if (b.id == selectedType.id) {
            return 1;
          }
          return 0; // Mantener el orden relativo entre los demás
        });
        columns.refresh();*/
      }
    });
  }

}