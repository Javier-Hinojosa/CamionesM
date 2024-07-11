import 'dart:async';

import 'package:camionesm/core/routes/routes.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{

  final showCardController = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await _loadingChangeCard();
    await _loadingChangePage();
  }

  _loadingChangeCard()=>
  Future.delayed(const Duration(milliseconds: 500), () => showCardController.value = true);

  _loadingChangePage() =>
    Timer(const Duration(seconds: 2,milliseconds: 500), () => Get.offAllNamed(Routes.login));


}