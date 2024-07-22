import 'package:camionesm/core/values/keys.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LegalRepresentativeController extends GetxController{

  final form=FormGroup({}).obs;
  final isValid=false.obs;

  @override
  void onInit() {
    super.onInit();

    form.value=FormGroup({
      Keys.name: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.lastName: FormControl<String>(validators: [
        Validators.required,
      ]),
    Keys.rfcLR: FormControl<String>(validators: [
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