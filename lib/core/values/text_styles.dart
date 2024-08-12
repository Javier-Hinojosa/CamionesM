import 'package:flutter/material.dart';
import 'package:get/get.dart';


final TextStyle titleLarge = Theme.of(Get.context!).textTheme.titleLarge!;
final TextStyle titleMedium = Theme.of(Get.context!).textTheme.titleMedium!;
final TextStyle titleSmall = Theme.of(Get.context!).textTheme.titleSmall!;

final TextStyle bodyLarge = Theme.of(Get.context!).textTheme.bodyLarge!;
///[bodyMedium] has configured whit color default disabledColor
final TextStyle bodyMedium =Theme.of(Get.context!).textTheme.bodyMedium!.apply(color: Theme.of(Get.context!).disabledColor);
final TextStyle bodySmall = Theme.of(Get.context!).textTheme.bodySmall!;

final TextStyle headlineLarge = Theme.of(Get.context!).textTheme.headlineLarge!;
final TextStyle labelLarge = Theme.of(Get.context!).textTheme.labelLarge!;
