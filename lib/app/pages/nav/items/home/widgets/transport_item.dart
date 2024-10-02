import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/card_deformed.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider_vertical.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CustomTransportItem extends StatelessWidget {
  const CustomTransportItem({super.key, this.onPressedNext});

  final void Function()? onPressedNext;

  @override
  Widget build(BuildContext context) {
    return CustomCardDeformed(
      height: 0.65,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowIdentify(context, "VJ010874"),
              SizedBox(height: Get.height * 0.01),
              _customCardMap(context),
              SizedBox(height: Get.height * 0.01),
              cardDriver(context),
              SizedBox(height: Get.height * 0.01),
              const DottedDivider(dashSpace: 2),
              SizedBox(height: Get.height * 0.02),
              _containerDriver(context),
              SizedBox(height: Get.height * 0.02),
              cardPointDirections(),
              SizedBox(height: Get.height * 0.02),
              Align(
                alignment: Alignment.centerRight,
                heightFactor: 1,
                child: SizedBox(
                    width: Get.width*0.13,
                    height: Get.height*0.06,
                    child: const CustomIconButton(
                        icon: Icons.arrow_forward_outlined,
                        backgroundColor: Globals.principalColor)),
              )
            ]).paddingAll(5)).paddingOnly(bottom: 10,left: 10);
  }

  Widget _customCardMap(BuildContext context) {
    const LatLng point1 = LatLng(48.8566, 2.3522);
    const LatLng point2 = LatLng(48.8666, 2.3522);
    var mapController= MapController();

    // Crea los límites para ajustar la vista del mapa
    final LatLngBounds bounds = LatLngBounds(point1, point2);

    // Ajusta la vista del mapa después de construir el widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mapController.fitCamera(CameraFit.bounds(padding:const EdgeInsets.all(20.0), bounds: bounds));
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
                  mapController: mapController,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomText("Camión:"),
          CustomText(
              "C2 Camion Unitario (2 llantas en el eje delantero y 4 llantas en el eje trasero)",
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w800)),
        ]);
  }

  static Widget rowIdentify(BuildContext context, String id){
    return  customTextRow(context, "ID", id, mainAxisAlignment: MainAxisAlignment.end);

  }
  static Widget customTextRow(BuildContext context, String title, String subtitle, {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center, Color? color}) {
    return Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          CustomText(title, style: titleMedium.apply(
              color: color,
              fontSizeDelta: -2,
              fontWeightDelta: FontWeight.w300.index)),
          SizedBox(width: Get.width * 0.01),
          CustomText(subtitle, style:TextStyle(color: color, fontSize: 14))
        ]);
  }

  Widget cardDriver(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(Paths.profile1)),
                SizedBox(width: Get.width * 0.03),
                SizedBox(
                    width: Get.width * 0.4,
                    height: Get.height * 0.05,
                    child: CustomContainer(
                        backgroundColor: Theme.of(context).cardColor,
                        width: Get.width * 0.4,
                        height: Get.height * 0.05,
                        child: const Center(child: CustomText("Carlos Fuentes",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)))))
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.star_rate_rounded,
                    color: Colors.black, size: 24),
                SizedBox(width: Get.width * 0.01),
                CustomText("4.2",
                    style: titleMedium.apply(
                        fontWeightDelta: FontWeight.bold.value))
              ])
        ]);
  }
  Widget cardPointDirections(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText("Puebla a CDMX", style: titleMedium),
          SizedBox(height: Get.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const CircleAvatar(
                    backgroundColor: Globals.principalColor,
                    child: Icon(Icons.location_on_outlined, color: Colors.black, size: 24.0)),
                SizedBox(width: Get.width*0.02),
                const CustomText("Salida", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
              ]),
              const CustomText(
                  """CDMX, México. 03/04/24""",
                  maxLines: 6)
            ]),
          VerticalDottedDivider(height: Get.height*0.01,color: Globals.principalColor).paddingOnly(left: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const CircleAvatar(
                    backgroundColor: Globals.principalColor,
                    child: Icon(Icons.location_on,
                        color: Colors.black, size: 24.0)),
                SizedBox(width: Get.width*0.02),
                const CustomText("Llegada", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
              ]),
              const CustomText(
                  """Puebla, México. 03/04/24""",
                  maxLines: 6)
            ])
        ]);
  }

}
