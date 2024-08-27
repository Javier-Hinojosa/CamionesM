import 'package:camionesm/core/values/keys.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InvoiceController extends GetxController{

  final formInvoice=FormGroup({}).obs;
  final formBank=FormGroup({}).obs;
  final isValidInvoice=false.obs;
  final isValidBank=false.obs;

  @override
  void onInit() {
    super.onInit();
    _initFormInvoice();
    _fillFormInvoice();

    _initFormBank();
    _fillFormBank();
  }

  void _initFormInvoice(){
    formInvoice.value=FormGroup({
      Keys.rfc: FormControl<String>(validators: [Validators.required]),
      Keys.name: FormControl<String>(validators: [Validators.required]),
      Keys.cp: FormControl<String>(validators: [Validators.required]),
      Keys.fiscalRegime: FormControl<String>(validators: [Validators.required]),
      Keys.use: FormControl<String>(validators: [Validators.required]),
      Keys.paymentMethod: FormControl<String>(validators: [Validators.required]),
      Keys.invoiceFiscal: FormControl<String>(validators: [Validators.required])
    }, validators: [Validators.required]);

    formInvoice.value.valueChanges.listen((p0) {
      if(formInvoice().valid){
        isValidInvoice(true);
      }else{
        isValidInvoice(false);
      }
    });
  }
  void _fillFormInvoice() {
    formInvoice().control(Keys.rfc).value="EN";
    formInvoice().control(Keys.name).value="enviogou";
    formInvoice().control(Keys.cp).value="02029";
    formInvoice().control(Keys.fiscalRegime).value="RFCCJKNSOOFMF";
    formInvoice().control(Keys.use).value="Gastos en general";
    formInvoice().control(Keys.paymentMethod).value="Trandferencia bancaria";
  }

  void _initFormBank() {
    formBank.value=FormGroup({
      Keys.bank: FormControl<String>(validators: [Validators.required]),
      Keys.beneficiary: FormControl<String>(validators: [Validators.required]),
      Keys.noAccount: FormControl<String>(validators: [Validators.required]),
      Keys.interbankCode: FormControl<String>(validators: [Validators.required]),
    }, validators: [Validators.required]);

    formBank.value.valueChanges.listen((p0) {
      if(formBank().valid){
        isValidBank(true);
      }else{
        isValidBank(false);
      }
    });

  }
  void _fillFormBank() {
    formBank().control(Keys.bank).value="EN";
    formBank().control(Keys.beneficiary).value="enviogou";
    formBank().control(Keys.noAccount).value="02029";
    formBank().control(Keys.interbankCode).value="RFCCJKNSOOFMF";
  }
}