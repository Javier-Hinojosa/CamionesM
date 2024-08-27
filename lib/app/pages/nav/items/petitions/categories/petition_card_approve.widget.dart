import 'package:camionesm/app/pages/nav/items/petitions/contracts/petition_card.contract.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/images/image_circle.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PetitionCardApprove extends PetitionCardContract {
  const PetitionCardApprove(
      {super.key, this.onDetail});

  final void Function()? onDetail;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        elevation: 12,
            backgroundColor: Globals.backgroundColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PetitionCardContract.rowIdentify(context, Icons.done_all_outlined, "VJ010874"),
                  SizedBox(height: Get.height * 0.01),
                  _customCardMap(context),
                  SizedBox(height: Get.height * 0.01),
                  cardDriver(),
                  SizedBox(height: Get.height * 0.01),
                  const DottedDivider(dashSpace: 2),
                  SizedBox(height: Get.height * 0.02),
                  _containerDriver(context),
                  SizedBox(height: Get.height * 0.02),
                  _containerProducts(context),
                  SizedBox(height: Get.height * 0.02),
                  cardDirections(),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: Get.width * 0.65,
                            child: CustomButton(
                                title: "Iniciar viaje",
                                onPressed: onDetail,
                                backgroundColor: Globals.principalColor)),
                        SizedBox(
                            width: Get.width*0.13,
                            height: Get.height*0.06,
                            child: const CustomIconButton(
                                icon: Icons.cloud_download_outlined,
                                backgroundColor: Globals.principalColor))
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  cardMoreDetails()
                ]).paddingAll(5));
  }

  Widget _customCardMap(BuildContext context) {
    const LatLng point1 = LatLng(48.8566, 2.3522);
    const LatLng point2 = LatLng(48.8666, 2.3522);

    // Crea los límites para ajustar la vista del mapa
    final LatLngBounds bounds = LatLngBounds(point1, point2);

    // Ajusta la vista del mapa después de construir el widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fitBounds(bounds);
    });

    return SizedBox(
        height: Get.height * 0.13,
        width: Get.width,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            clipBehavior: Clip.antiAlias,
            child: Stack(children: [
              FlutterMap(
                  mapController: controller.mapController(),
                  options: const MapOptions(minZoom: 5, maxZoom: 16),
                  children: [
                    TileLayer(
                        urlTemplate: Globals.templateURL,
                        subdomains: const ['a', 'b', 'c']),
                    const MarkerLayer(markers: [
                      Marker(
                          width: 60.0,
                          height: 60.0,
                          point: LatLng(48.8566, 2.3522),
                          child: CircleAvatar(
                              backgroundColor: Globals.principalColor,
                              child: Icon(Icons.location_on_outlined,
                                  color: Colors.black, size: 40.0))),
                      Marker(
                          width: 60.0,
                          height: 60.0,
                          point: LatLng(48.8666, 2.3522),
                          child: CircleAvatar(
                              backgroundColor: Globals.principalColor,
                              child: Icon(Icons.location_on,
                                  color: Colors.black, size: 40.0)))
                    ]),
                    PolylineLayer(polylines: [
                      Polyline(points: [
                        const LatLng(48.8566, 2.3522),
                        const LatLng(48.8666, 2.3522)
                      ], strokeWidth: 3.0, color: Colors.black)
                    ])
                  ])
            ])));
  }
  Widget _containerDriver(BuildContext context){
    return CustomContainerOutline(
        backgroundColor: Colors.white,
        contentPadding: 10,
        radius: 15,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(Paths.truck2,
                              width: Get.width*0.25,
                              height: Get.height*0.08,
                              fit: BoxFit.cover)).paddingOnly(right: 24),
                      Positioned(
                          right: 1,
                          top: 1,
                          bottom: 1,
                          width: Get.width*0.15,
                          child:  CustomImageCircle(url: Paths.profile3,
                              height: Get.height,
                              borderWidth: 2,
                              paddingAll: 0,
                              radius: 45))
                    ]),
                SizedBox(width: Get.width*0.01),
                Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PetitionCardContract.customTextRow(context ,"Conductor: ID ","CN010874"),
                          PetitionCardContract.customTextRow(context ,"Transporte: ID ","TR010874")
                        ]))
              ])
        ]);
  }
  Widget _containerProducts(BuildContext context){
    return CustomContainer(
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(Paths.papers,
                  width: Get.width*0.3,
                  height: Get.height*0.08,
                  fit: BoxFit.cover)),
          SizedBox(width: Get.width*0.02),
          Flexible(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomText("Industrial, Telas Nylon...  , 8tl",maxLines: 4),
                PetitionCardContract.customTextRow(context, "ID ", "PR01284",
                    mainAxisAlignment: MainAxisAlignment.start,
                    color: Theme.of(context).disabledColor)
              ]))
        ]));
  }


}
