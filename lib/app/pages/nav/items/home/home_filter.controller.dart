import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/models/models/state.model.dart';
import 'package:camionesm/data/services/country/country.contract.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

 abstract class HomeFilterController extends GetxController{
  final ICountryService iCountryService;

  static const List<String> labelsFilters=Globals.principalStates;
  static const List<String> typeProducts=Globals.typeProducts;

  final RxList<StateModel> statesOrigin = <StateModel>[].obs;
  final RxList<StateModel> statesDestiny = <StateModel>[].obs;

  final filterForm=FormGroup({}).obs;


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
  }

  Future<void> _getStates () async {
    var states=  await iCountryService.getStates();
    statesOrigin(states);
    statesDestiny(states);
  }


  onLabelChange(String labelsFilter, String state) {
    filterForm().control(state).value=labelsFilter;
  }



}