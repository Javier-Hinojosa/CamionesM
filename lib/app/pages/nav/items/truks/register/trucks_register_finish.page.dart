import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrucksRegisterFinishPage extends GetView<TrucksRegisterController> {
  const TrucksRegisterFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => () => controller.onReturnHome(),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(onBack: () => controller.onReturnHome()),
          body: ListView(shrinkWrap: true, children: [
            SizedBox(height: Get.height*0.05),
            Align(
                alignment: Alignment.center,
                child: CustomText("¡Excelente!", style: titleLarge)),
            Container(padding: const EdgeInsets.all(10)),
            Align(
                alignment: Alignment.centerLeft,
                child: CustomText("Nos encontramos validando la información obtenida y que todo se encuentre en orden.",
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    style: titleMedium.apply(
                        fontWeightDelta: FontWeight.w100.index,
                        fontSizeDelta: 4))),
            CustomImageAssets(
                url: Paths.search,
                height: Get.height * 0.25,
                width: Get.width * 0.05,
                fit: BoxFit.fill).paddingAll(40),
            CustomText("Vuelve dentro de 24 hrs para obtener la verificación de tus documentos.", maxLines: 3,textAlign: TextAlign.center, style: bodyMedium.apply(fontSizeDelta: 2)).paddingAll(30),
            CustomButton(
                backgroundColor: Globals.principalColor,
                title: "Regrasar al inicio",
                onPressed: () => controller.onReturnHome())
          ]).paddingAll(15)));
  }
}
