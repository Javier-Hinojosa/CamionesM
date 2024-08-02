import 'dart:ui';

import 'package:camionesm/app/pages/splash_screen/splash_screen.controller.dart';
import 'package:camionesm/app/utils/animation.utils.dart';
import 'package:camionesm/app/widgets/images/images_assets.widget.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      SizedBox(
          width: Get.width,
          height: Get.height,
          child: const CustomImageAssets(url: Paths.splash)),
      _cardLogo(context)
    ]));
  }

  Widget _cardLogo(BuildContext context) {
    return Obx(() => AnimationUtils.downToUP(
        controller: controller.showCardController,
        child: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                      blurRadius: 10.0,
                      spreadRadius: 2.0)
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(60),
                          child: CustomImageAssets(
                              url: Paths.logo,
                              width: Get.width * 0.3,
                              height: Get.height*0.5,
                              fit: BoxFit.fill),
                        )))))));
  }
}
