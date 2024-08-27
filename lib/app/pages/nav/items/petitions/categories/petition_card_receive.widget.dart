import 'package:camionesm/app/pages/nav/items/petitions/contracts/petition_card.contract.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_loading.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PetitionCardReceive extends PetitionCardContract {
  const PetitionCardReceive(
      {super.key, this.onPressedReject, this.onPressedAccept});

  final void Function()? onPressedReject;
  final void Function()? onPressedAccept;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        elevation: 12,
            backgroundColor: Globals.backgroundColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PetitionCardContract.rowIdentify(context, Icons.mail_outline, "VJ010874"),
                  SizedBox(height: Get.height * 0.01),
                  const CustomText("Respondió a la solicitud"),
                  SizedBox(height: Get.height * 0.01),
                  CustomContainerLoading.image(context, height: Get.height * 0.1, path: Paths.papers),
                  SizedBox(height: Get.height * 0.01),
                  cardDriver(),
                  SizedBox(height: Get.height * 0.02),
                  PetitionCardContract.customTextRow(context, "Tipo de Carga", "Industrial", mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  PetitionCardContract.customTextRow(context, "Peso", "8tl", mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  cardEarnings(),
                  SizedBox(height: Get.height * 0.02),
                  const DottedDivider(dashSpace: 2),
                  SizedBox(height: Get.height * 0.02),
                  const CustomText("Con base a tu viaje"),
                  SizedBox(height: Get.height * 0.02),
                  cardDirections(),
                  SizedBox(height: Get.height * 0.02),
                  const CustomText("Estatus de solicitud"),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: Get.width * 0.38,
                            child: CustomButton(
                                title: "Rechazar",
                                height: Get.height*0.06,
                                onPressed: onPressedReject,
                                backgroundColor: Colors.black)),
                        SizedBox(
                            width: Get.width * 0.38,
                            child: CustomButton(
                                title: "Aceptar viaje",
                                onPressed: onPressedAccept,
                                height: Get.height*0.06,
                                width: Get.width * 0.38,
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
            child: FlutterMap(
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
                ])));
  }
}
