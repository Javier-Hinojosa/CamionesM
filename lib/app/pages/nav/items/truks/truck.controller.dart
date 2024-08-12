import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TrucksController extends GetxController{

  final formRegisterTruck=FormGroup({}).obs;
  final isValidRegisterTruckForm=false.obs;

  final formRegisterSpecific=FormGroup({}).obs;
  final isValidRegisterSpecificForm=false.obs;

  final typeProducts= <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    _initFormRegisterTruck();
    _initFormRegisterSpecific();
    _initTypeLoad();
  }

  void _initFormRegisterTruck(){
    formRegisterTruck.value=FormGroup({
      Keys.typeTruck: FormControl<String>(validators: [Validators.required]),
      Keys.brand: FormControl<String>(validators: [Validators.required]),
      Keys.year: FormControl<String>(validators: [Validators.required]),
      Keys.howMuchWeight: FormControl<String>(validators: [Validators.required]),
      //Keys.typeLoad: FormControl<String>(validators: [Validators.required]),
      //Keys.typeAgricultural: FormControl<String>(validators: [Validators.required])
    }, validators: [Validators.required]);

    formRegisterTruck.value.valueChanges.listen((p0) {
      if(formRegisterTruck().valid){
        isValidRegisterTruckForm(true);
      }else{
        isValidRegisterTruckForm(false);
      }
    });
  }
  void _initFormRegisterSpecific() {
    formRegisterSpecific.value=FormGroup({
      Keys.truckPlate: FormControl<String>(validators: [Validators.required]),
      Keys.trailerPlate: FormControl<String>(validators: [Validators.required]),
      Keys.trailerPlate2: FormControl<String>(validators: [Validators.required]),
      Keys.sct: FormControl<String>(validators: [Validators.required]),
      Keys.responsibleInsurer: FormControl<String>(validators: [Validators.required]),
      Keys.noPolicy: FormControl<String>(validators: [Validators.required]),
    }, validators: [Validators.required]);

    formRegisterSpecific.value.valueChanges.listen((p0) {
      if(formRegisterSpecific().valid){
        isValidRegisterSpecificForm(true);
      }else{
        isValidRegisterSpecificForm(false);
      }
    });
  }

  void _initTypeLoad() {
    typeProducts().addAll(Globals.typeProducts);
    typeProducts().add("Marcar Todos");
  }



  onHowMuchWeightChange(value) {


  }




}