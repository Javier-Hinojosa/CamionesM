import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/nav/items/trips/register/trip_register.controller.dart';
import 'package:camionesm/app/pages/nav/items/trips/register/trip_register_opportunities.page.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class TripConfirmPage extends GetView<TripRegisterController>{
  const TripConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(leadingColor: Theme.of(context).scaffoldBackgroundColor,backgroundColor: Globals.principalColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SimpleTitleCard(CustomNotification(child: CircleAvatar(backgroundColor:Colors.white, child: Icon(Icons.flag_outlined))), "Registrar nuevo viaje"),
             CustomContainer(
               backgroundColor: Theme.of(context).disabledColor,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText("Viajes registrados al momento",style: TextStyle(color: Colors.white)),
                      CircleAvatar(backgroundColor:Colors.white54, child: Text("1"))
                    ])),
            SizedBox(height: Get.height*0.02),
            _customCardMap(context),
            _customCardReduce(context, "Calcular ganancia"),
            SizedBox(height: Get.height*0.01),
            Align(alignment: Alignment.centerLeft, child: CustomText("Detalles de viaje", style: titleLarge.apply(fontSizeDelta: -4))),
            const Divider(thickness: 2),
            SizedBox(height: Get.height*0.01),
            Row(
                children: [
                  const CircleAvatar(backgroundColor: Globals.principalColor, child: Icon(Icons.location_on_outlined)),
                  SizedBox(width: Get.width*0.03),
                  CustomText("Salida",style: bodyLarge.apply(fontWeightDelta: FontWeight.w200.index))
                ]),
            SizedBox(height: Get.height*0.02),
            _dataTrip(context, Keys.stateOrigin,Keys.municipalOrigin, Keys.dateOrigin, Keys.hourOrigin),
            SizedBox(height: Get.height*0.02),
            Row(
                children: [
                  const CircleAvatar(backgroundColor: Globals.principalColor, child: Icon(Icons.location_on)),
                  SizedBox(width: Get.width*0.03),
                  CustomText("Llegada",style: bodyLarge.apply(fontWeightDelta: FontWeight.w200.index))
                ]),
            SizedBox(height: Get.height*0.02),
            _dataTrip(context, Keys.stateDestiny,Keys.municipalDestiny, Keys.dateDestiny, Keys.hourDestiny),
            SizedBox(height: Get.height*0.01),
            const Divider(thickness: 2),
            SizedBox(height: Get.height*0.01),
            SizedBox(
              width: Get.width,
              child: CustomContainerOutline(
                  contentPadding: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  radius: 15,
                  children: [
                    const CustomText("Conductor",style: TextStyle(fontSize: 16)),
                    SizedBox(height: Get.height*0.005),
                    CustomText(controller.formRegisterTrip().control(Keys.driver).value,maxLines: 1,style: headlineLarge.apply(fontSizeDelta: -13,fontWeightDelta: FontWeight.w200.index))
                  ])),
            SizedBox(height: Get.height*0.02),
            SizedBox(
                width: Get.width,
                child: CustomContainerOutline(
                    contentPadding: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    radius: 15,
                    children: [
                      const CustomText("Conductor",style: TextStyle(fontSize: 16)),
                      SizedBox(height: Get.height*0.005),
                      CustomText(controller.formRegisterTrip().control(Keys.truck).value,maxLines: 1,style: headlineLarge.apply(fontSizeDelta: -13,fontWeightDelta: FontWeight.w200.index)),
                      CustomText("ID TR01284",maxLines: 1,style: headlineLarge.apply(fontSizeDelta: -18,fontWeightDelta: FontWeight.w100.index,color: Theme.of(context).disabledColor))
                    ])),
            SizedBox(height: Get.height*0.02),
            CustomText("Kilometros",maxLines: 1,style: headlineLarge.apply(fontSizeDelta: -13,fontWeightDelta: FontWeight.w100.index)),
            SizedBox(height: Get.height*0.005),
            CustomText("215 km", style: bodyMedium, textAlign: TextAlign.start),
            SizedBox(height: Get.height*0.01),
            const Divider(thickness: 2),
            SizedBox(height: Get.height*0.005),
            CustomButton(title: "Siguiente",backgroundColor: Colors.black, onPressed: ()=> Get.to(()=>const TripRegisterOpportunitiesPage())),
            SizedBox(height: Get.height*0.02)
          ]).paddingAll(20)));
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
        height: Get.height * 0.2,
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
  Widget _dataTrip(BuildContext context, String keyState, String keyMunicipal, String keyDate, String keyHour) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText("${controller.formRegisterTrip().control(keyState).value}, ${controller.formRegisterTrip().control(keyMunicipal).value}",style: bodyMedium, textAlign: TextAlign.start),
        SizedBox(height: Get.height*0.01),
        CustomText("${DateFormat("dd-MM-yy").format(controller.formRegisterTrip().control(keyDate).value)} ${controller.formRegisterTrip().control(keyHour).value}" ,style: bodyMedium,textAlign: TextAlign.start)
      ]);
 }

}