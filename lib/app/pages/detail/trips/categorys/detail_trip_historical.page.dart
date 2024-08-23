import 'package:camionesm/app/pages/detail/trips/detail_trips.page.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/app/widgets/time_line.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTripHistoricalPage extends DetailTripsPage {
  const DetailTripHistoricalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              targetUser(context),
              SizedBox(height: Get.height*0.02),
              const DottedDivider(dashSpace: 2),
              SizedBox(height: Get.height*0.03),
              CustomText("Detalles del viaje", style: titleMedium.apply(fontSizeDelta: 2)),
              SizedBox(height: Get.height*0.02),
              targetLocations(context,backgroundIconColor: Theme.of(context).disabledColor),
              SizedBox(height: Get.height*0.04),
              CustomText("Observaciones y comentarios", style: titleMedium.apply(fontSizeDelta: 2)),
              SizedBox(height: Get.height*0.02),
              CustomContainerOutline(
                  contentPadding: 10,
                  radius: 15,
                  backgroundColor: Colors.white,
                  children: const [
                    CustomText("Cuento con diversos tipos de textiles para este envío. En su mayoría bastante delicados. Pese al embalaje solicito que no se exponga la tela.",
                        textAlign: TextAlign.start,
                        maxLines: 10)
                  ]),
              SizedBox(height: Get.height*0.02),
              CustomContainer(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(Paths.papers,
                            width: Get.width*0.3,
                            fit: BoxFit.cover)),
                    SizedBox(width: Get.width*0.02),
                    Flexible(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText("Registro de productos",style: bodyLarge.apply(color:  Theme.of(context).disabledColor)),
                          const CustomText("Industrial, Telas Nylon...  , 8tl",maxLines: 3),
                          rowText(context, "ID ", "PR01284",color: Theme.of(context).disabledColor)
                        ]))
                  ])),
              SizedBox(height: Get.height*0.02),
              const DottedDivider(dashSpace: 2)
            ])),
        SizedBox(height: Get.height*0.03),
        CustomText("Estatus de viaje", style: titleMedium.apply(fontSizeDelta: 2)),
        SizedBox(height: Get.height*0.02),
        CustomTimeLine(
            color: Theme.of(context).disabledColor.withOpacity(0.6),
            iconsColor: Colors.white60,
            items: [
          BuildTimelineTile(text: "03 Abr 2024  08:14",
              subtitle: "Recolección correcta",
              isActive: true,
              trailing: CustomButton.withoutBorder(
                  title: "Viaje iniciado",
                  height: Get.height*0.05,
                  width: Get.width*0.35)),
          BuildTimelineTile(text: "05 Abr 2024  08:14",
              subtitle: "Entrega estimada del envio",
              isActive: true,
              trailing: CustomButton.withoutBorder(
                  title: "Viaje Finalizado",
                  height: Get.height*0.05,
                  width: Get.width*0.35))
        ]),
        SizedBox(height: Get.height*0.02),
        CustomText("Estatus", style: titleMedium.apply(fontSizeDelta: 2)),
        SizedBox(height: Get.height * 0.02),
        CustomContainerOutline(children: [const CustomText("Completado", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)).paddingAll(5)]),
        SizedBox(height: Get.height * 0.02),
        const DottedDivider(dashSpace: 2),
        SizedBox(height: Get.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
                "Descarga de Carta Porte",
                maxLines: 10,
                style: bodyLarge.apply(
                    fontSizeDelta: -2,
                    color: Theme.of(context).disabledColor)),
            SizedBox(width: Get.width*0.02),
            SizedBox(
                width: Get.width*0.09,
                height: Get.height*0.05,
                child: const CustomIconButton(
                    icon: Icons.cloud_download_outlined,
                    backgroundColor: Globals.principalColor))
          ]),
        SizedBox(height: Get.height * 0.02),
      ]);
  }
}
