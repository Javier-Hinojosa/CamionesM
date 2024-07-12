import 'package:camionesm/core/routes/routes.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginController extends GetxController{

  static const int emailQuantityMinLength = 5;
  static const int passQuantityMinLength = 4;

  final isPasswordVisible = false.obs;
  final loginForm=FormGroup({}).obs;

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
  }

  changePasswordVisibility() {
      isPasswordVisible(!isPasswordVisible());
  }

  onLogin()=>
    Get.toNamed(Routes.home);

  onSingUp()=>
    Get.toNamed(Routes.singUp);

}