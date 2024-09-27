import 'dart:async';

import 'package:camionesm/app/utils/shared_prefrences.utils.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/models/services/profile_user.service.dart';
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
      _validateRoute();
  //  Timer(const Duration(seconds: 2,milliseconds: 500), () => _validateRoute());

  _validateRoute()async{
    var shared = await SharedUtils.create<String>();
    var isLogged= shared.getValue(Keys.userKey)!=null;
    if(isLogged){
      final ProfileUserService tempDataService = ProfileUserService();
      tempDataService.token="token_all";
    }

    Get.toNamed(Routes.navBar);

  }

}