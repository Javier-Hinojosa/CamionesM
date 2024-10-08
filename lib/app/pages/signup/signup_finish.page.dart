import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFinishPage extends StatelessWidget {
  const SignUpFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => Get.toNamed(Routes.splash),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(onBack: () => Get.toNamed(Routes.splash)),
          body: ListView(shrinkWrap: true, children: [
            Container(padding: const EdgeInsets.all(50)),
            Align(
                alignment: Alignment.center,
                child: CustomText("¡Excelente!", style: titleLarge)),
            Container(padding: const EdgeInsets.all(10)),
            Align(
                alignment: Alignment.center,
                child: CustomText("¡Tu cuenta fue creada exitósamente!.",
                    textAlign: TextAlign.center,
                    style: titleMedium.apply(
                        fontWeightDelta: FontWeight.w100.index,
                        fontSizeDelta: 4))),
            Container(padding: const EdgeInsets.all(30)),
            CustomImageAssets(
                url: Paths.congrats,
                height: Get.height * 0.25,
                width: Get.width * 0.2,
                fit: BoxFit.fill),
            Container(padding: const EdgeInsets.all(20)),
            CustomButton(
                backgroundColor: Globals.principalColor,
                title: "Continuar",
                onPressed: () => Get.toNamed(Routes.splash)).paddingAll(10),
          ]).paddingAll(15)),
    );
  }
}
