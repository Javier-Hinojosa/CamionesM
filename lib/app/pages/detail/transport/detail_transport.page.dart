import 'package:camionesm/app/pages/detail/transport/detail_transport.controller.dart';
import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/drop_down.widget.dart';
import 'package:camionesm/app/widgets/images/images_carrousel.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DetailTransportPage extends GetView<DetailTransportController> {
  const DetailTransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(leadingColor: Colors.white, trailing: [
          IconButton(
              onPressed: () {},
              icon: const CustomIconButton(
                  icon: Icons.bookmark_outline, backgroundColor: Colors.white))
        ]),
        body: Obx(() => CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: ImagesCarrousel(
                    images: controller.imgList,
                    valueIndex: controller.indexCarrousel(),
                    onPageChanged: (p0, p1) => controller.indexCarrousel(p0),
                    carouselController: controller.controllerCarrousel()),
              ),
              SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Acerca del cliente",
                            textAlign: TextAlign.left,
                            style: titleLarge.apply(fontSizeDelta: -5))),
                    SizedBox(height: Get.height * 0.02),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      const CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(Paths.profile2)),
                      SizedBox(width: Get.width * 0.03),
                      SizedBox(
                          width: Get.width * 0.4,
                          height: Get.height * 0.05,
                          child: CustomButton(
                              title: "Carlos Fuentes",
                              backgroundColor: Globals.secondColor,
                              width: Get.width * 0.4,
                              height: Get.height * 0.05,
                              onPressed: () {}))
                    ]),
                    Row(children: [
                      const CustomText("Cliente verificado"),
                      SizedBox(width: Get.width * 0.01),
                      const Icon(Icons.check_circle_outline,
                          color: Colors.lightGreen)
                    ]),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("ID CL03459",
                            style: TextStyle(color: Colors.black38))),
                    Row(
                        children: List.filled(
                            5,
                            Icon(Icons.star,
                                color: Colors.yellow[700]!, size: 30))),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("450 Envíos realizados",
                            style: TextStyle(fontWeight: FontWeight.w400))),
                    const Divider(thickness: 2),
                    _customCardMap(context),
                    _customCardReduce(context, "Distancia: 120 km"),
                    SizedBox(height: Get.height * 0.02),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Detalles de viaje",
                            textAlign: TextAlign.left,
                            style: titleLarge.apply(fontSizeDelta: -8))),
                    const ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                            backgroundColor: Globals.principalColor,
                            child: Icon(Icons.location_on_outlined,
                                color: Colors.black, size: 40.0)),
                        title: CustomText("Origen",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                        subtitle: CustomText(
                            "Calle Pitágoras 526, Narvarte Ponie... 03020 CDMX, México. 03/04/24 12:00 hrs",
                            style: TextStyle(fontWeight: FontWeight.w800))),
                    const ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                            backgroundColor: Globals.principalColor,
                            child: Icon(Icons.location_on_outlined,
                                color: Colors.black, size: 40.0)),
                        title: CustomText("Destino",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                        subtitle: CustomText(
                            "Calle Pitágoras 526, Narvarte Ponie... 03020 CDMX, México. 03/04/24 12:00 hrs",
                            style: TextStyle(fontWeight: FontWeight.w800))),
                    SizedBox(height: Get.height * 0.02),
                    const DottedDivider(),
                    SizedBox(height: Get.height * 0.02),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Detalles del transporte",
                            textAlign: TextAlign.left,
                            style: titleLarge.apply(fontSizeDelta: -8))),
                    SizedBox(height: Get.height * 0.04),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 24,
                              child: Image.asset(Paths.truck)),
                          SizedBox(width: Get.width * 0.03),
                          Flexible(
                              child: _textWithBold("Camión: ",
                                  normalText:
                                      "C2 Camion Unitario (2 llantas en el eje delantero y 4 llantas en el eje trasero) Freightliner, 2009."))
                        ]),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 24,
                              child: Image.asset(Paths.bulk)),
                          SizedBox(width: Get.width * 0.03),
                          Flexible(
                              child: _textWithBold("Rango de carga: ",
                                  normalText: "16-22 toneladas"))
                        ]),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 24,
                              child: Image.asset(Paths.box)),
                          SizedBox(width: Get.width * 0.03),
                          Flexible(
                              child: _textWithBold("Tipo de carga: ",
                                  normalText:
                                      "Craga seca, mudanza, paquetería"))
                        ]),
                    SizedBox(height: Get.height * 0.05),
                    CustomButton(
                        title: "Enviar Solicitud A",
                        backgroundColor: Globals.principalColor,
                        onPressed: () => _onDialogSend(context)),
                    SizedBox(height: Get.height * 0.02),
                    CustomButton(
                        title: "Enviar Solicitud B",
                        backgroundColor: Globals.principal2Color,
                        onPressed: () => _onDialogSendClient(context))
                  ])))
            ])));
  }

  //region widgets
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

  Widget _textWithBold(String textBold, {String? normalText, String? endNormalText}) {
    return RichText(
        maxLines: 3,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: textBold,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: normalText ?? "", style: bodyMedium),
              TextSpan(text: endNormalText ?? "")
            ]));
  }
  //endregion

  //region dialogs
  Future<bool> _onDialogSend(BuildContext context) {
    var titleSmallMod = titleSmall.apply(
        fontWeightDelta: FontWeight.w100.index, fontSizeDelta: 4);
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
      Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).disabledColor.withOpacity(0.2),
              child: Image.asset(Paths.clipboardPlus).paddingAll(20))),
      Align(
          alignment: Alignment.center,
          child: CustomText("Selecciona tu envío", style: titleLarge)),
      CustomText(
          "Selecciona uno de tus envíos registrados o registra uno nuevo",
          textAlign: TextAlign.center,
          maxLines: 3,
          style: bodyMedium.apply(color: Theme.of(context).disabledColor)),
      SizedBox(height: Get.height * 0.05),
      Align(
          alignment: Alignment.centerLeft,
          child: CustomText("Tus envíos registrados", style: titleSmallMod)),
      CustomDropDown(
          paddingAll: 0,
          items: controller.registerSends
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (p0) => controller.selectedSend(p0),
          value: controller.selectedSend()),
      SizedBox(height: Get.height * 0.1),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 6,
                child: SizedBox(
                    height: Get.height * 0.05,
                    child: CustomButton(
                        title: "Registrar nuevo envío",
                        height: Get.height * 0.02,
                        width: Get.width,
                        onPressed: () async {
                          Get.back(result: true);
                          await _onDialogManeuver(context);
                        }))),
            const Spacer(),
            Expanded(
                flex: 4,
                child: SizedBox(
                    height: Get.height * 0.05,
                    child: CustomButton(
                        title: "Cotizar",
                        height: Get.height * 0.02,
                        width: Get.width,
                        backgroundColor: Colors.black,
                        onPressed: () => Get.back(result: true))))
          ])
    ]));
  }

  Future<bool> _onDialogManeuver(BuildContext context) {
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
      Align(
          alignment: Alignment.center,
          child: CustomText("El envío no incluye “La maniobra”",
              style: titleLarge)),
      Align(
          alignment: Alignment.topCenter,
          child: Image.asset(Paths.truckCharger).paddingAll(20)),
      CustomText(
          "A la llegada del camión, el conductor no tiene la responsabilidad de movilizar los productos a envío, dentro del transporte.",
          textAlign: TextAlign.center,
          maxLines: 3,
          style: bodyMedium.apply(color: Theme.of(context).disabledColor)),
      SizedBox(height: Get.height * 0.1),
      SizedBox(
          height: Get.height * 0.07,
          child: CustomButton(
              title: "Continuar",
              height: Get.height * 0.02,
              width: Get.width,
              backgroundColor: Colors.black,
              onPressed: () async {
                Get.back(result: true);
                await _onDialogConfirm(context);
              })),
      SizedBox(height: Get.height * 0.02),
      CustomText("Ver detalles",
          textAlign: TextAlign.right, maxLines: 3, style: bodyMedium)
    ]));
  }

  Future<bool> _onDialogConfirm(BuildContext context) {
    var titleSmall = bodyMedium.apply(color: Theme.of(context).disabledColor);
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
      _customCardMap(context),
      _customCardReduce(context, "Distancia: 120 km"),
      SizedBox(height: Get.height * 0.02),
      Align(
          alignment: Alignment.centerLeft,
          child: CustomText("Cotizacion de viaje", style: titleLarge)),
      SizedBox(height: Get.height * 0.02),
      CustomText(
          "En base al cálculo se obtuvo el siguiente monto. Una vez aceptada la solicitud por la otra parte se procede a realizar el pago.",
          textAlign: TextAlign.left,
          maxLines: 4,
          style: titleSmall),
      SizedBox(height: Get.height * 0.02),
      Align(
          alignment: Alignment.centerLeft,
          child: CustomText("\$4,300 MXN",
              style: titleLarge.apply(fontSizeDelta: 3))),
      SizedBox(height: Get.height * 0.02),
      CustomText("Costo sin seguro de envío incluido",
          textAlign: TextAlign.left, maxLines: 4, style: titleSmall),
      SizedBox(height: Get.height * 0.03),
      CustomButton(
          title: "Solicitar Viaje",
          height: Get.height * 0.07,
          width: Get.width,
          backgroundColor: Globals.principalColor,
          onPressed: () async {
            Get.back(result: true);
            await _onDialogSuccess(context);
          })
    ]));
  }

  Future<bool> _onDialogSuccess(BuildContext context) {
    var disableText = bodyMedium.apply(color: Theme.of(context).disabledColor);
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
      Align(
          alignment: Alignment.topCenter,
          child: Image.asset(Paths.circleCheck).paddingAll(20)),
      Align(
          alignment: Alignment.center,
          child: CustomText("¡La solicitud se ha enviado correctamente!",
              maxLines: 3, style: titleLarge.apply(fontSizeDelta: -2))),
      SizedBox(height: Get.height * 0.02),
      CustomText(
          "A través de “Mis solicitudes” podrás ver el estatus de la solicitud realizada.",
          textAlign: TextAlign.center,
          maxLines: 4,
          style: disableText),
      SizedBox(height: Get.height * 0.05),
      CustomButton(
          title: "Ir a mis solicitudes",
          height: Get.height * 0.07,
          width: Get.width,
          backgroundColor: Globals.principalColor,
          onPressed: () async {
            Get.back(result: true); //close dialog
            Get.back(); //exit DetailPage
            Get.find<NavBarController>()
                .onItemTapped(2); //indexed page in 'Mis Solicitudes'
          })
    ]));
  }

  Future<bool> _onDialogSendClient(BuildContext context) {
    var titleSmallMod = titleSmall.apply(
        fontWeightDelta: FontWeight.w100.index, fontSizeDelta: 4);
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
      Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).disabledColor.withOpacity(0.2),
              child: Image.asset(Paths.clipboardPlus).paddingAll(20))),
      Align(
          alignment: Alignment.center,
          child: CustomText("Selecciona tu envío", style: titleLarge)),
      CustomText(
          "Selecciona uno de tus envíos registrados o registra uno nuevo",
          textAlign: TextAlign.center,
          maxLines: 3,
          style: bodyMedium.apply(color: Theme.of(context).disabledColor)),
      SizedBox(height: Get.height * 0.05),
      Align(
          alignment: Alignment.centerLeft,
          child: CustomText("Tus envíos registrados", style: titleSmallMod)),
      CustomDropDown(
          paddingAll: 0,
          items: controller.registerSends
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (p0) => controller.selectedSend(p0),
          value: controller.selectedSend()),
      SizedBox(height: Get.height * 0.1),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 6,
                child: SizedBox(
                    height: Get.height * 0.05,
                    child: CustomButton(
                        title: "Registrar nuevo envío",
                        height: Get.height * 0.02,
                        width: Get.width,
                        onPressed: () async {
                          Get.back(result: true);
                          await _onDialogManeuver(context);
                        }))),
            const Spacer(),
            Expanded(
                flex: 4,
                child: SizedBox(
                    height: Get.height * 0.05,
                    child: CustomButton(
                        title: "Cotizar",
                        height: Get.height * 0.02,
                        width: Get.width,
                        backgroundColor: Colors.black,
                        onPressed: () => Get.back(result: true))))
          ])
    ]));
  }
//endregion
}
