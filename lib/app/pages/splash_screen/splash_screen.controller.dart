import 'dart:async';
import 'dart:convert';

import 'package:camionesm/app/utils/shared_prefrences.utils.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/models/models/auth.model.dart';
import 'package:camionesm/data/models/services/profile_user.service.dart';
import 'package:camionesm/data/services/user/user.contract.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{

  final showCardController = false.obs;
  final IUserService _userService;
  SplashScreenController(this._userService);
  @override
  void onInit() async {
    super.onInit();
    await _loadingChangeCard();
    await _loadingChangePage();
  }

  _loadingChangeCard()=> Future.delayed(const Duration(milliseconds: 500), () => showCardController.value = true);

  _loadingChangePage() => _validateTokenRefresh();
  //  Timer(const Duration(seconds: 2,milliseconds: 500), () => _validateRoute());

  _validateTokenRefresh() async{
    var shared = await SharedUtils.create<String>();
   var refreshToken= shared.getValue(Keys.refreshToken);
    _userService.refresh(refreshToken??"").then((value)async {
     if(value.access==null){
       await  shared.clearAll();
     }
    }).whenComplete(() async{
      await _validateRoute(shared);
    });
  }

  _validateRoute(SharedUtils<String> shared)async{
    var userData = _getDataUser(shared);
    if(userData!=null){
      final ProfileUserService tempDataService = ProfileUserService();
      tempDataService.userModel=userData;
    }
    Get.toNamed(Routes.navBar);
  }

  AuthUserModel? _getDataUser(SharedUtils<String> shared){
    var userDataJson= shared.getValue(Keys.userData);

    if (userDataJson == null || userDataJson.isEmpty) {
      return null;
    }

    try{
      final Map<String, dynamic> jsonData = json.decode(userDataJson);
      var userData=AuthUserModel.fromJson(jsonData);
      return userData;
    }catch(e){
      return null;
    }
  }

}