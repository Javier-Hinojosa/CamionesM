import 'package:camionesm/app/pages/nav/items/trips/contracts/my_trip_card.contract.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider_vertical.widget.dart';
import 'package:camionesm/app/widgets/images/image_circle.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MyTripCardHistorical extends MyTripCard {
  const MyTripCardHistorical({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomContainer(
            backgroundColor: Colors.white.withOpacity(1.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: Get.width*0.2,
                            child: const Card(
                                color: Globals.principalColor,
                                child: Icon(Icons.book_outlined,color: Colors.black,size: 30))),
                        _rowText(context,"ID ","TR01284")
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  _customCardMap(context),
                  SizedBox(height: Get.height * 0.02),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ListTile(
                            contentPadding: EdgeInsets.all(0),
                            minVerticalPadding: 0,
                            visualDensity: VisualDensity.compact,
                            dense: false,
                            leading: CircleAvatar(
                                backgroundColor: Globals.principalColor,
                                child: Icon(Icons.location_on_outlined, color: Colors.black, size: 40.0)),
                            title: CustomText("Salida", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                            subtitle: CustomText(
                                "CDMX, México. 03/04/24 12:00 hrs",
                                style: TextStyle(fontWeight: FontWeight.w800))),
                        VerticalDottedDivider(
                            height: Get.height*0.02,
                            dashSpace: 3,
                            strokeWidth: 4,
                            color: Globals.principalColor).paddingOnly(left: 20),
                        const ListTile(
                            contentPadding: EdgeInsets.all(0),
                            minVerticalPadding: 0,
                            visualDensity: VisualDensity.compact,
                            dense: false,
                            leading: CircleAvatar(
                                backgroundColor: Globals.principalColor,
                                child: Icon(Icons.location_on,
                                    color: Colors.black, size: 40.0)),
                            title: CustomText("Llegada",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            subtitle: CustomText(
                                "Puebla, México. 03/04/24 12:00 hrs",
                                style: TextStyle(fontWeight: FontWeight.w800)))
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  CustomContainerOutline(
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
                                            width: Get.width*0.3,
                                            height: Get.height*0.09,
                                            fit: BoxFit.cover)).paddingOnly(right: 24),
                                    Positioned(
                                        right: 1,
                                        top: 1,
                                        bottom: 1,
                                        width: Get.width*0.2,
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
                                        _rowText(context ,"Conductor: ID ","CN010874"),
                                        _rowText(context ,"Transporte: ID ","TR010874")
                                      ]))
                            ])
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  CustomText("Status",style: titleSmall),
                  SizedBox(height: Get.height * 0.02),
                  CustomContainerOutline(children: [
                    const CustomText("Completado", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)).paddingAll(5)
                  ]),
                  SizedBox(height: Get.height * 0.02),
                  SizedBox(
                      height: Get.height*0.05,
                      width: Get.width*0.5,
                      child: CustomButton(
                          title: "Ver detalles",
                          height: Get.height*0.05,
                          width: Get.width*0.4,
                          onPressed: ()=>Get.toNamed("${Routes.detailTrip}?type=${TripsList.historical}"),
                          backgroundColor: Globals.principalColor)),
                  SizedBox(height: Get.height * 0.02)
                ]).paddingAll(5)).paddingOnly(top: 10,bottom: 10);
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

  Widget _rowText(BuildContext context, String title, String content){
  return  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(title,maxLines: 1, style: titleSmall.apply(fontWeightDelta: FontWeight.w100.index)),
          Flexible(child: CustomText(content,maxLines: 1))
        ]);
  }

}
