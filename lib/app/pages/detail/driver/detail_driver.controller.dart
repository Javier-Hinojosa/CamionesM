import 'dart:io';

import 'package:camionesm/core/common/extensors.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdfx/pdfx.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DetailDriverController extends GetxController{

  final controllerCarrousel = CarouselController().obs;
  final indexCarrousel= 0.obs;
  final List<String> imgList = [
    Paths.truck2,
    'assets/images/carrousel.png',
    'assets/images/map.png',
    Paths.truck1,
    Paths.papers,
  ];

  final isEditedDriver= false.obs;
  final formRegisterDriver=FormGroup({}).obs;
  final isValidRegisterDriverForm=false.obs;

  final typeProducts= Globals.typeProducts;
  final isEditedProducts= false.obs;

  var selectedFile = Rxn<File>();
  PdfController? pdfController;

  @override
  void onInit() {
    super.onInit();
    _initFormRegisterTruck();
    _fillFormRegisterTruck();
  }

  void _initFormRegisterTruck(){
    formRegisterDriver.value=FormGroup({
      Keys.name: FormControl<String>(validators: [Validators.required]),
      Keys.lastName: FormControl<String>(validators: [Validators.required]),
      Keys.phone: FormControl<String>(validators: [Validators.required]),
      Keys.rfc: FormControl<String>(validators: [Validators.required]),
    }, validators: [Validators.required]);

    formRegisterDriver.value.valueChanges.listen((p0) {
      if(formRegisterDriver().valid){
        isValidRegisterDriverForm(true);
      }else{
        isValidRegisterDriverForm(false);
      }
    });
  }
  void _fillFormRegisterTruck() {
    formRegisterDriver().control(Keys.name).value="Jorge";
    formRegisterDriver().control(Keys.lastName).value="Martínez López";
    formRegisterDriver().control(Keys.phone).value="+525523235953".formatPhoneNumber();
    formRegisterDriver().control(Keys.rfc).value="AGB-0980";
  }


  onSaveProducts() {
    isEditedProducts(false);
  }

  onSaveTransport() {
    isEditedDriver(false);
  }

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);;
    if (pickedFile != null) {
      selectedFile.value = File(pickedFile.path);
      print(selectedFile());
      pdfController = null;
    }
  }

}