import 'package:camionesm/app/pages/nav/items/petitions/categories/petition_card_approve.widget.dart';
import 'package:camionesm/app/pages/nav/items/petitions/categories/petition_card_receive.widget.dart';
import 'package:camionesm/app/pages/nav/items/petitions/categories/petition_card_send.widget.dart';
import 'package:camionesm/app/pages/nav/items/petitions/contracts/petition_card.contract.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/items/generic_check.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PetitionsController extends GetxController{


  final listDynamic= <PetitionCardContract>[].obs;
  final mapController= MapController().obs;
  final labelText= "".obs;

  final  _petitionsApproves= <PetitionCardApprove>[];
  final  _petitionsReceives= <PetitionCardReceive>[];
  final  _petitionsSends= <PetitionCardSend>[];


  final typeListPetitions = [
    GenericCheck(TypePetition.receives, "Recibidas",Icons.mail_outline,isSelect: true),
    GenericCheck(TypePetition.sends, "Enviadas",FontAwesomeIcons.paperPlane),
    GenericCheck(TypePetition.approves, "Aprobadas",Icons.done_all_outlined)
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _fillAllList();
  }

  @override
  void onReady() {
    super.onReady();

    _listenOrderListType();
    typeListPetitions.refresh();
  }

  onChangeListType(GenericCheck e) {
    for (var element in typeListPetitions) {
      if(e==element){
        element.isSelect=true;
      }else {
        element.isSelect=false;
      }
    }
    typeListPetitions.refresh();
  }

  void _listenOrderListType(){
    typeListPetitions.listen((p0) {
      for (var element in p0) {
        if (element.isSelect) {
          listDynamic().clear();
          listDynamic().addAll(getListDynamic(element.id));
          labelText(getLabel(element.id));
        }}});
  }

 List<PetitionCardContract> getListDynamic(Enum id){
    switch(id){
      case TypePetition.approves:return _petitionsApproves;
      case TypePetition.sends:return _petitionsSends;
      case TypePetition.receives:return _petitionsReceives;
      default: return [];
    }
  }

  String getLabel(Enum id){
    switch(id){
      case TypePetition.approves:return "Viajes en curso";
      case TypePetition.sends:return "Solicitudes enviadas";
      case TypePetition.receives:return "Solicitudes recibidas";
      default: return "";
    }
  }

  void _fillAllList() {
    _petitionsApproves.addAll([
      PetitionCardApprove(onDetail: ()=>Get.toNamed("${Routes.detailPetition}?type=${TypePetition.approves}")),
      PetitionCardApprove(onDetail: ()=>Get.toNamed("${Routes.detailPetition}?type=${TypePetition.approves}"))
    ]);
    _petitionsReceives.addAll([
       PetitionCardReceive(onPressedAccept: ()=>Get.toNamed("${Routes.detailPetition}?type=${TypePetition.receives}"),onPressedReject: (){}),
       PetitionCardReceive(onPressedAccept: ()=>Get.toNamed("${Routes.detailPetition}?type=${TypePetition.receives}"),onPressedReject: (){})
    ]);
    _petitionsSends.addAll([
       PetitionCardSend(onPressedAccept: ()=>Get.toNamed("${Routes.detailPetition}?type=${TypePetition.sends}"),onPressedReject: null,onDelete:null),
       PetitionCardSend(onPressedAccept: ()=>Get.toNamed("${Routes.detailPetition}?type=${TypePetition.sends}"),onPressedReject: null,onDelete:null)
    ]);
  }
  void fitBounds(LatLngBounds bounds) {
    mapController().fitCamera(CameraFit.bounds(padding:const EdgeInsets.all(20.0), bounds: bounds));
  }

}