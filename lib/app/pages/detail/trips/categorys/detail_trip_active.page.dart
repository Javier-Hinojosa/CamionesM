import 'package:camionesm/app/pages/detail/trips/detail_trips.page.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/images/image_circle.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTripActivePage extends DetailTripsPage {
  const DetailTripActivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText("Detalles de tu viaje", style: titleMedium.apply(fontSizeDelta: 2)),
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
        CustomText("Puebla a CDMX", style: titleMedium),
        SizedBox(height: Get.height * 0.02),
        targetLocations(context),
        SizedBox(height: Get.height * 0.02),
        const DottedDivider(dashSpace: 2),
        SizedBox(height: Get.height * 0.02),
        CustomText("Datos registrados", style: titleMedium.apply(fontSizeDelta: 2)),
        SizedBox(height: Get.height * 0.02),
        CustomText("Tu conductor",style: titleSmall.apply(color: Theme.of(context).disabledColor)),
        SizedBox(height: Get.height * 0.01),
        CustomContainerOutline(
            contentPadding: 10,
            radius: 15,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomImageCircle(
                    radius: 28,
                    borderWidth: 1,
                    url: Paths.profile3),
                SizedBox(width: Get.width*0.05),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                        "Jorge Martinez L",
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.w800)),
                    rowText(context, "ID ", "CN0110874")
                  ])
              ])]),
        SizedBox(height: Get.height * 0.02),
        CustomText("Tu transporte",style: titleSmall.apply(color: Theme.of(context).disabledColor)),
        SizedBox(height: Get.height * 0.01),
        CustomContainerOutline(
            contentPadding: 10,
            radius: 15,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(Paths.truck2,
                            width: Get.width*0.25,
                            height: Get.height*0.07,
                            fit: BoxFit.cover)),
                    SizedBox(width: Get.width*0.05),
                    Flexible(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                                "C2 Camion Unitario (2 llantas en el eje delantero y 4 llantas en el eje trasero)",
                                maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.w800)),
                            rowText(context, "ID ", "TR010874")
                          ]))
                  ])
            ]),
        SizedBox(height: Get.height * 0.02),
        const DottedDivider(dashSpace: 2),
        SizedBox(height: Get.height * 0.02),
        CustomText("Estatus de viaje", style: titleMedium.apply(fontSizeDelta: 2)),
        SizedBox(height: Get.height * 0.02),
        CustomContainerOutline(children: [const CustomText("En espera", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)).paddingAll(5)])
      ]);
  }
}
