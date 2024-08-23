import 'package:camionesm/app/pages/nav/items/trips/trips.page.dart';
import 'package:camionesm/app/pages/nav/items/trips/widgets/my_trip_card_active.widget.dart';
import 'package:camionesm/app/pages/nav/items/trips/widgets/my_trip_card_historical.widget.dart';
import 'package:camionesm/app/pages/nav/items/trips/widgets/my_trip_card_in_progress.widget.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/items/check.item.dart';
import 'package:camionesm/data/models/items/generic_check.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class TripsController extends GetxController{

  final isRegister = false.obs;

  final mapController= MapController().obs;

  final typeListTrips = [
        GenericCheck(TripsList.actives, "Activos",Icons.history_toggle_off_outlined,isSelect: true),
        GenericCheck(TripsList.inProgress, "En curso",Icons.sensors_outlined),
        GenericCheck(TripsList.historical, "Historial",Icons.book_outlined)].obs;
  final  columns= <ItemTripColumnType>[].obs;

  final tripsFilter= <CheckItem>[
    CheckItem("Recién Agregados"),
    CheckItem("Modelo"),
    CheckItem("Año"),
    CheckItem("Tipo de camión"),
    CheckItem("Tipo de carga")].obs;

  @override
  void onInit() {
    super.onInit();
    _filledColumns();
  }
  @override
  void onReady() {
    super.onReady();
    _listenOrderListType();
  }

  onDeleteItem() {
    print('deleted');
  }
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
        columns.sort((a, b) {
          // Si la columna coincide con el tipo seleccionado, colócala al inicio
          if (a.id == selectedType!.id) {
            return -1;
          } else if (b.id == selectedType.id) {
            return 1;
          }
          return 0; // Mantener el orden relativo entre los demás
        });
        columns.refresh();
      }
    });
  }
  void fitBounds(LatLngBounds bounds) {
    mapController().fitCamera(CameraFit.bounds(padding:const EdgeInsets.all(20.0), bounds: bounds));
  }
  void _filledColumns() {
    columns.addAll([
      ItemTripColumnType(TripsList.actives,"Viajes Activos", "Tus viajes registrados visibles para usuarios que deseen mandar una solicitud de envío.",
          cards: [
            MyTripCardActive(onDelete: ()=>onDeleteItem()),
            MyTripCardActive(onDelete: ()=>onDeleteItem())
          ]),
      const ItemTripColumnType(TripsList.inProgress,"Viajes en curso", "Visualiza tus viajes ya iniciados o en curso.",
          cards: [
            MyTripCardInProgress(),
            MyTripCardInProgress()
          ]),
      const ItemTripColumnType(TripsList.historical,"Tu historial","Visualiza el historial de todos tus viajes.",
          cards:[
            MyTripCardHistorical(),
            MyTripCardHistorical()
          ])
    ]);
    columns.refresh();
  }

  onDetailActive(){

  }
}