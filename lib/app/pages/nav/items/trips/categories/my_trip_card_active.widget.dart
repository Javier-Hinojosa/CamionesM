import 'package:camionesm/app/pages/nav/items/trips/contracts/my_trip_card.contract.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
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

class MyTripCardActive extends MyTripCardContract {
   const MyTripCardActive({super.key, required this.onDelete});


  ///[onDelete] has required full this function, have a predetermine dialog
  final void Function() onDelete;

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
                            child: Icon(Icons.history_toggle_off_outlined,color: Colors.black,size: 30))),
                      _rowText(context,"ID ","TR01284")
                    ]),
                  SizedBox(height: Get.height * 0.02),
                  _customCardMap(context),
                  _customCardReduce(context, "Calcular ganancia"),
                  SizedBox(height: Get.height * 0.02),
                   CustomText("Registro de tu viaje",style: TextStyle(color: Theme.of(context).disabledColor.withOpacity(0.8))),
                  SizedBox(height: Get.height * 0.01),
                  Align(alignment: Alignment.centerLeft, child: CustomText("Puebla a CDMX", style: titleMedium.apply(fontSizeDelta: 2))),
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Theme.of(context).disabledColor.withOpacity(0.1),
                                  child: const Icon(Icons.date_range_outlined)),
                              SizedBox(width: Get.width*0.01),
                              CustomText("Fecha de envío", maxLines: 3, style: bodyLarge.apply(fontWeightDelta: FontWeight.w300.index))
                            ]),
                        CustomText("03/04/24", maxLines: 3, style: bodyMedium.apply( fontSizeDelta: 1))
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: Get.height*0.05,
                            width: Get.width*0.5,
                            child: CustomButton(
                                title: "Ver detalles",
                                height: Get.height*0.05,
                                width: Get.width*0.4,
                                backgroundColor: Globals.principalColor,
                                onPressed: ()=>Get.toNamed("${Routes.detailTrip}?type=${TypeTrip.actives}"))),
                         Row(
                          children: [
                            GestureDetector(
                              onTap: ()=>Get.toNamed("${Routes.detailTrip}?type=${TypeTrip.actives}&isEdit=true"),
                              child:  CircleAvatar(
                                  backgroundColor: Theme.of(context).disabledColor.withOpacity(0.1),
                                  child: const Icon(Icons.edit_outlined))),
                            SizedBox(width: Get.width*0.01),
                            GestureDetector(
                                onTap: () async{
                                var result = await CustomDialogs.dialogDeleteItem(context);
                                if(result) {
                                  onDelete();
                                }},
                                child:  CircleAvatar(
                                    backgroundColor: Theme.of(context).disabledColor.withOpacity(0.1),
                                    child: const Icon(Icons.delete_outline_outlined)))
                          ])
                      ])
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
  Widget _customCardReduce(BuildContext context, String title) {
    const disableColor = Colors.transparent;
    return CustomContainer(
        backgroundColor: disableColor,
        circularRadius: 15,
        child: Align(
            alignment: Alignment.centerRight,
            child: CustomText(title,
                maxLines: 1,
                style: bodyMedium.apply(
                    fontWeightDelta: FontWeight.w200.index,
                    decoration: TextDecoration.underline))))
        .paddingOnly(top: 10, bottom: 10);
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
