import 'package:camionesm/core/values/keys.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AccessDataController extends GetxController{

  final form=FormGroup({}).obs;
  final isValid=false.obs;

  @override
  void onInit() {
    super.onInit();

    form.value=FormGroup({
      Keys.user: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.pass: FormControl<String>(validators: [
        Validators.required,
      ]),
    Keys.passConfirm: FormControl<String>(validators: [
        Validators.required,
      ])
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

}