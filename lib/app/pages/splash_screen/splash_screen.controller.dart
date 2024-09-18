import 'dart:async';

import 'package:camionesm/app/pages/splash_screen/select_user.page.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{

  var showCardController = false.obs;
  var typeUser = TypeUser.none.obs;


  @override
  void onInit() async {
    super.onInit();
    await Future.wait([_loadingChangeCard(), _loadingChangePage()]);
  }

 Future<void> _loadingChangeCard()=>
  Future.delayed(const Duration(milliseconds: 500), () => showCardController.value = true);

  Future<void> _loadingChangePage() =>
      Future.delayed(const Duration(seconds: 2,milliseconds: 500), () => Get.to(()=>const SelectUserPage()));


}