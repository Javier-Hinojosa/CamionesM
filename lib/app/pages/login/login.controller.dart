import 'dart:convert';

import 'package:camionesm/app/pages/nav/items/home/home.controller.dart';
import 'package:camionesm/app/utils/shared_prefrences.utils.dart';
import 'package:camionesm/app/utils/snack_bar.utils.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/services/user/user.contract.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginController extends GetxController{

  static const int emailQuantityMinLength = 5;
  static const int passQuantityMinLength = 4;
  final IUserService _userService;

  bool isLoading=false;

  final isPasswordVisible = false.obs;
  final loginForm=FormGroup({}).obs;

  LoginController(this._userService);

  @override
  void onInit() {
    super.onInit();

    loginForm.value=FormGroup({
      'user': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(emailQuantityMinLength)
      ]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(passQuantityMinLength)
      ]),
    }, validators: [
      Validators.required
    ]);

    loginForm().control("user").value="admin";
    loginForm().control("password").value="root";
  }



  changePasswordVisibility() {
      isPasswordVisible(!isPasswordVisible());
  }

  onLogin() {
    isLoading=true;
    update();
    if(loginForm().valid){
    _userService.auth(loginForm().control("user").value, loginForm().control("password").value).then((value) async{
      if(value.detail==null){
        if(value.user!.isActive){
        var shared= await SharedUtils.create<String>();
        shared.setValue(Keys.accessToken, value.access!);
        shared.setValue(Keys.refreshToken, value.refresh!);
        shared.setValue(Keys.userData, json.encode(value.user!.toJson()));
        SnackBarUtils.success("Acceso autorizado");
         Get.offAllNamed(Routes.splash);
        }else {
          SnackBarUtils.error("Usuario Inactivo");
        }
      }else{
        SnackBarUtils.error(value.detail??"");
        if (kDebugMode) {
          print(value.detail);
        }
      }
    }).whenComplete(() {
      isLoading=false;
      update();
    });
    }else{
      loginForm().markAllAsTouched();
      isLoading=false;
      update();
    }
  }

  onSingUp()=> Get.toNamed(Routes.singUp);

}