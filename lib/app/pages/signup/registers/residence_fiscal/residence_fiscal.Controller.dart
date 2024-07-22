import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/services/country/country.contract.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ResidenceFiscalController extends GetxController{
  final ICountryService iCountryService;

  final form=FormGroup({}).obs;
  final isValid=false.obs;
  final RxList<String> states = <String>[].obs;
  final Map<String, List<String>> municipals = {};
  final RxList<String> municipalsSelect = <String>[].obs;

  ResidenceFiscalController(this.iCountryService);

  @override
  void onInit() async{
    super.onInit();
    form.value=FormGroup({
      Keys.state: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.municipal: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.street: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.streetNoExt: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.streetNoInt: FormControl<String>(validators: [
        Validators.required,
      ]),
      Keys.postalCode: FormControl<String>(validators: [
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
   await _getStates();
  }

  onFinish() {}

  Future<void> _getStates ()async {
    var states=  await iCountryService.getStates();
    this.states(states.keys.toList());
    municipals.addAll(states);
  }

  onChangeState(String e) {
    municipalsSelect(municipals[e]!.toList());
  }
}