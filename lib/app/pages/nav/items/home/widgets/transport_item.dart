import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/cards/card_deformed.widget.dart';
import 'package:camionesm/app/widgets/cards/loading_card.widget.dart';
import 'package:camionesm/app/widgets/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTransportItem extends StatelessWidget {
  const CustomTransportItem({super.key, this.onPressedNext});

  final void Function()? onPressedNext;

  @override
  Widget build(BuildContext context) {
    return CustomCardDeformed(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          _customTextRow(context, "ID", "VJ010874",
              mainAxisAlignment: MainAxisAlignment.end),
          LoadingCard.image(
              context: context, height: Get.height * 0.1, path: Paths.papers),
          SizedBox(height: Get.height * 0.02),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(Paths.profile2)),
                      SizedBox(width: Get.width * 0.03),
                      SizedBox(
                          width: Get.width * 0.4,
                          height: Get.height * 0.05,
                          child: CustomButton(
                              title: "Carlos Fuentes",
                              color: Globals.principalColor,
                              width: Get.width * 0.4,
                              height: Get.height * 0.05,
                              onPressed: () {}))
                    ]),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Icon(Icons.star_rate_rounded,
                      color: Colors.black, size: 32),
                  SizedBox(width: Get.width * 0.03),
                  CustomText("4.2",
                      style: titleLarge.apply(
                          fontWeightDelta: FontWeight.bold.value))
                ])
              ]),
          SizedBox(height: Get.height * 0.02),
          const DottedDivider(),
          CustomText("Puebla a CDMX",
              style: titleMedium.apply(
                  fontSizeDelta: 12, fontWeightDelta: FontWeight.w100.index)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.black12,
                  child:
                      Icon(Icons.calendar_month_outlined, color: Colors.black)),
              SizedBox(width: Get.width * 0.03),
              CustomText("Fecha de envío", style: titleMedium)
            ]),
            const CustomText("03/04/24")
          ]),
          SizedBox(height: Get.height * 0.01),
          _customTextRow(context, "Tipo de Carga", "Industrial",
              mainAxisAlignment: MainAxisAlignment.spaceBetween),
          _customTextRow(context, "Peso", "8tl",
              mainAxisAlignment: MainAxisAlignment.spaceBetween),
          _customTextRow(context, "Descripción", "200 Unidades de telas.",
              mainAxisAlignment: MainAxisAlignment.spaceBetween),
          SizedBox(height: Get.height * 0.01),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText("Ganancia",
                    style: titleMedium.apply(
                        fontWeightDelta: FontWeight.w300.index)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText("\$4,300 MXN",
                          style: titleMedium.apply(
                              fontSizeDelta: 14,
                              fontWeightDelta: FontWeight.w300.index)),
                      SizedBox(
                          width: Get.width * .12,
                          height: Get.height * 0.055,
                          child: CustomIconButton(
                              icon: Icons.arrow_forward,
                              backgroundColor: Globals.principalColor,
                              onPressed: onPressedNext))
                    ])
              ])
        ])).paddingAll(10);
  }

  Widget _customTextRow(BuildContext context, String title, String subtitle,
      {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center}) {
    return Row(mainAxisAlignment: mainAxisAlignment, children: [
      CustomText(title,
          style: titleMedium.apply(fontWeightDelta: FontWeight.w300.index)),
      SizedBox(width: Get.width * 0.03),
      CustomText(subtitle)
    ]);
  }
}
