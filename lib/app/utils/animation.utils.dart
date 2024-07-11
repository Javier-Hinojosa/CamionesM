import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationUtils {
  static AnimatedPositioned downToUP({
    required Widget child,
    required RxBool controller}) {
    return AnimatedPositioned(
        duration: const Duration(seconds: 2), // Duración de la animación
        curve: Curves.easeInOutBack, // Curva de la animación
        bottom: controller() ? MediaQuery.of(Get.context!).size.height / 2 - 200 : -100,
        left: MediaQuery.of(Get.context!).size.width / 2 - 115,
        child: child);
  }
}
