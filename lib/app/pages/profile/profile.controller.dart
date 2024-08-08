import 'package:camionesm/app/utils/snack_bar.utils.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileController extends GetxController{

  final formGeneral=FormGroup({}).obs;
  final isValid=false.obs;
  final isActive=false.obs;

  @override
  void onInit() {
    super.onInit();
    formGeneral.value=FormGroup({
      Keys.name: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.email: FormControl<String>(validators: [
        Validators.required,
        Validators.email,
      ]),
      Keys.phone: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.user: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.pass: FormControl<String>(validators: [
        Validators.required,
      ])
    }, validators: [Validators.required]);

    formGeneral.value.valueChanges.listen((p0) {
      if(formGeneral().valid){
        isValid(true);
      }else{
        isValid(false);
      }
    });
    _initFormGeneral();
  }

  _initFormGeneral(){
    formGeneral().control(Keys.name).value="Juan Escutia";
    formGeneral().control(Keys.email).value="juanescuti@gmail.com";
    formGeneral().control(Keys.phone).value="+52 5523235953";
    formGeneral().control(Keys.user).value="Juan23";
    formGeneral().control(Keys.pass).value="Abcd1234";

  }

  onFinishGeneralCard() {
    SnackBarUtils.success("Datos Guardados con Exito");
    isActive(false);
  }
}