import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/services/country/country.contract.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class HomeFilterController extends GetxController{
  final ICountryService iCountryService;

  static const List<String> labelsFilters=Globals.principalStates;
  static const List<String> typeProducts=Globals.typeProducts;

  final RxList<String> statesOrigin = <String>[].obs;
  final RxList<String> statesDestiny = <String>[].obs;

  final filterForm=FormGroup({}).obs;
  final isFilterValid=false.obs;

  HomeFilterController(this.iCountryService);

  @override
  void onInit()async {
    _initForms();
    await _getStates();
    super.onInit();
  }

  void _initForms() {
    filterForm.value=FormGroup({
      Keys.stateOrigin: FormControl<String>(validators: [Validators.required]),
      Keys.stateDestiny: FormControl<String>(validators: [Validators.required]),
      Keys.date: FormControl<DateTime>(validators: [])
    },validators: [Validators.required]);
    filterForm.value.valueChanges.listen((p0) {
      if(filterForm().valid){
        isFilterValid(true);
      }else{
        isFilterValid(false);
      }
    });
  }

  Future<void> _getStates () async {
    var states=  await iCountryService.getStates();
    statesOrigin(states.keys.toList());
    statesDestiny(states.keys.toList());
  }


  onLabelChange(String labelsFilter, String state) {
    filterForm().control(state).value=labelsFilter;
  }



}