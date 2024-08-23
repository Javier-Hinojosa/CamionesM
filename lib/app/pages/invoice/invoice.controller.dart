import 'package:camionesm/app/utils/snack_bar.utils.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InvoiceController extends GetxController{

  final formInvoice=FormGroup({}).obs;
  final isValid=false.obs;
  final isActive=false.obs;

  @override
  void onInit() {
    super.onInit();
    formInvoice.value=FormGroup({
      Keys.rfc: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.name: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.cp: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.fiscalRegime: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.use: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.paymentMethod: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.invoiceFiscal: FormControl<String>(validators: [
        Validators.required,
      ])
    }, validators: [Validators.required]);

    formInvoice.value.valueChanges.listen((p0) {
      if(formInvoice().valid){
        isValid(true);
      }else{
        isValid(false);
      }
    });
    _initFormGeneral();
  }

  _initFormGeneral(){
    formInvoice().control(Keys.name).value="Juan Escutia";
    formInvoice().control(Keys.email).value="juanescuti@gmail.com";
    formInvoice().control(Keys.phone).value="+52 5523235953";
    formInvoice().control(Keys.user).value="Juan23";
    formInvoice().control(Keys.pass).value="Abcd1234";

  }

  onFinishGeneralCard() {
    SnackBarUtils.success("Datos Guardados con Exito");
    isActive(false);
  }
}