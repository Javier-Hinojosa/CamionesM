import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/data/models/items/check.item.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DetailTruckController extends GetxController{

  final controllerCarrousel = CarouselController().obs;
  final indexCarrousel= 0.obs;
  final List<String> imgList = [
    Paths.truck2,
    'assets/images/carrousel.png',
    'assets/images/map.png',
    Paths.truck1,
    Paths.papers,
  ];

  final isEditedTransport= false.obs;
  final formRegisterTruck=FormGroup({}).obs;
  final isValidRegisterTruckForm=false.obs;

  final typeProducts= Globals.typeProducts;
  final checks = <CheckItem>[].obs;
  final isEditedProducts= false.obs;

  @override
  void onInit() {
    super.onInit();
    _initFormRegisterTruck();
    _fillFormRegisterTruck();
    _initProducts();
  }

  void _initFormRegisterTruck(){
    formRegisterTruck.value=FormGroup({
      Keys.typeTruck: FormControl<String>(validators: [Validators.required]),
      Keys.brand: FormControl<String>(validators: [Validators.required]),
      Keys.year: FormControl<String>(validators: [Validators.required]),
      Keys.fuel: FormControl<String>(validators: [Validators.required]),
      Keys.truckPlate: FormControl<String>(validators: [Validators.required]),
      Keys.trailerPlate: FormControl<String>(validators: [Validators.required]),
      Keys.trailerPlate2: FormControl<String>(validators: [Validators.required]),
      Keys.sct: FormControl<String>(validators: [Validators.required]),
      Keys.responsibleInsurer: FormControl<String>(validators: [Validators.required]),
    }, validators: [Validators.required]);

    formRegisterTruck.value.valueChanges.listen((p0) {
      if(formRegisterTruck().valid){
        isValidRegisterTruckForm(true);
      }else{
        isValidRegisterTruckForm(false);
      }
    });
  }

  void _fillFormRegisterTruck() {
    formRegisterTruck().control(Keys.typeTruck).value="C2 Camion Unitario (2 llantas en el eje delantero y 4 llantas en el eje trasero)";
    formRegisterTruck().control(Keys.brand).value="Mercedes Benz";
    formRegisterTruck().control(Keys.year).value="2005";
    formRegisterTruck().control(Keys.fuel).value="Diésel";
    formRegisterTruck().control(Keys.truckPlate).value= "AGB-0980";
    formRegisterTruck().control(Keys.trailerPlate).value= "-";
    formRegisterTruck().control(Keys.trailerPlate2).value= "-";
    formRegisterTruck().control(Keys.sct).value= "9867463953";
    formRegisterTruck().control(Keys.responsibleInsurer).value= "MAPFRESEGUROS";
  }

  void _initProducts() {
    checks.addAll(typeProducts.map((e) => CheckItem(e,isSelect: true)).toList());
  }

  onCheckChange(int index, bool? value) {
    if(isEditedProducts()){
      checks[index].isSelect=value??false;
      checks.refresh();
    }
  }

  onSaveProducts() {
    isEditedProducts(false);
  }

  onSaveTransport() {
    isEditedTransport(false);
  }


}