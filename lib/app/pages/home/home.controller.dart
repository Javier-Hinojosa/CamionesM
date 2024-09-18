import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/services/country/country.contract.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class HomeController extends GetxController {
  late final TypeUser typePage;
  final ICountryService iCountryService;

  static const List<String> labelsFilters=Globals.principalStates;
  static const List<String> typeProducts=Globals.typeProducts;

  final RxList<String> statesOrigin = <String>[].obs;
  final RxList<String> statesDestiny = <String>[].obs;

 late final FormGroup filterForm;
  final isFilterValid=false.obs;

  final enableNotification = true.obs;
  final loading = true.obs;
  final isHomeView=true.obs;
  static const List<LatLng> points= Globals.points;
  final mapController= MapController().obs;


  HomeController(this.iCountryService){
    _initForms();
  }

  @override
  void onInit()async {

    await _getStates();
    loading(false);
    super.onInit();
  }

  void _initForms() {
    filterForm=FormGroup({
      Keys.stateOrigin: FormControl<String>(validators: [Validators.required]),
      Keys.stateDestiny: FormControl<String>(validators: [Validators.required]),
      Keys.date: FormControl<DateTime>(validators: [])
    },validators: [Validators.required]);

    filterForm.valueChanges.listen((p0) {
      if(filterForm.valid){
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
    filterForm.control(state).value=labelsFilter;
  }



}