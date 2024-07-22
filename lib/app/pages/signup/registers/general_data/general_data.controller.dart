import 'package:camionesm/core/values/keys.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GeneralDataController extends GetxController{

  final form=FormGroup({}).obs;
  final isValid=false.obs;

  @override
  void onInit() {
    super.onInit();

    form.value=FormGroup({
      Keys.reasonSocial: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.phone: FormControl<String>(validators: [
        Validators.required,
      ]),
    Keys.email: FormControl<String>(validators: [
        Validators.required,
      ]),
        Keys.emailConfirm: FormControl<String>(validators: [
        Validators.required,
      ]),
    Keys.rfcGD: FormControl<String>(validators: [
        Validators.required,
      ]),
    }, validators: [
      Validators.required
    ]);

    form.value.valueChanges.listen((p0) {
      if(form().valid){
        isValid(true);
      }else{
        isValid(false);
      }
    });
  }

  onFinish() {

  }

  onPhoneComplete(String phone) {
    form.value.control(Keys.phone).value=phone;
  }

}