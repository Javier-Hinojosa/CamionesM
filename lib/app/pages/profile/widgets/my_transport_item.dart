import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_loading.widget.dart';
import 'package:camionesm/app/widgets/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCustomTransportItem extends StatelessWidget {
  const MyCustomTransportItem(
      {super.key, this.onPressedReject, this.onPressedAccept});

  final void Function()? onPressedReject;
  final void Function()? onPressedAccept;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
            backgroundColor: Globals.backgroundColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: Get.width * 0.25,
                            height: Get.height * 0.05,
                            child: const CustomIconButton(
                                icon: Icons.mail_outline,
                                backgroundColor: Colors.black)),
                        _customTextRow(context, "ID", "VJ010874",
                            mainAxisAlignment: MainAxisAlignment.end)
                      ]),
                  SizedBox(height: Get.height * 0.01),
                  const CustomText("Respondió a la solicitud"),
                  SizedBox(height: Get.height * 0.02),
                  CustomContainerLoading.image(context,
                      height: Get.height * 0.1,
                      path: Paths.papers),
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
                                      backgroundColor: Globals.principalColor,
                                      width: Get.width * 0.4,
                                      height: Get.height * 0.05,
                                      onPressed: () {}))
                            ]),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.star_rate_rounded,
                                  color: Colors.black, size: 32),
                              SizedBox(width: Get.width * 0.03),
                              CustomText("4.2",
                                  style: titleLarge.apply(
                                      fontWeightDelta: FontWeight.bold.value))
                            ])
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  _customTextRow(context, "Tipo de Carga", "Industrial",
                      mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  _customTextRow(context, "Peso", "8tl",
                      mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText("Ganancia",
                            style: titleMedium.apply(
                                fontWeightDelta: FontWeight.w300.index)),
                        CustomText("\$4,300 MXN",
                            style: titleMedium.apply(
                                fontSizeDelta: 14,
                                fontWeightDelta: FontWeight.w300.index))
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  const DottedDivider(),
                  SizedBox(height: Get.height * 0.02),
                  const CustomText("Status de solicitud"),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: Get.width * 0.45,
                            child: CustomButton(
                                title: "Rechazar",
                                onPressed: onPressedReject,
                                backgroundColor: Colors.black)),
                        SizedBox(
                            width: Get.width * 0.45,
                            child: CustomButton(
                                title: "Aceptar viaje",
                                onPressed: onPressedAccept,
                                backgroundColor: Globals.principalColor))
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: CustomText("Mas detalles",
                          style: TextStyle(fontWeight: FontWeight.w500)))
                ]).paddingAll(5))
        .paddingAll(10);
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
