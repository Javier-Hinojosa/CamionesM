import 'dart:io';

import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register_finish.page.dart';
import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdfx/pdfx.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TrucksRegisterController extends GetxController{

  final formRegisterTruck=FormGroup({}).obs;
  final isValidRegisterTruckForm=false.obs;

  final formRegisterSpecific=FormGroup({}).obs;
  final isValidRegisterSpecificForm=false.obs;

  final formRegisterPhoto1=FormGroup({}).obs;
  final isValidRegisterPhotoForm1=false.obs;

  final formRegisterPhoto2=FormGroup({}).obs;
  final isValidRegisterPhotoForm2=false.obs;

  final formRegisterPhoto3=FormGroup({}).obs;
  final isValidRegisterPhotoForm3=false.obs;


  final typeProducts= <String>[].obs;

  var selectedFile = Rxn<File>();
  PdfController? pdfController;


  @override
  void onInit() {
    super.onInit();
    _initFormRegisterTruck();
    _initFormRegisterSpecific();
    _initFormRegisterPhoto1();
    _initFormRegisterPhoto2();
    _initFormRegisterPhoto3();
    _initTypeLoad();
  }

  @override
  void onClose() {
    pdfController?.dispose();
    super.onClose();
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
  void _initFormRegisterPhoto1() {
    formRegisterPhoto1.value=FormGroup({
      Keys.picksTarget1: FormControl<String>(validators: []),
      Keys.picksTarget2: FormControl<String>(validators: []),
      Keys.dueDate: FormControl<DateTime>(validators: [Validators.required]),
    }, validators: [Validators.required]);

    formRegisterPhoto1.value.valueChanges.listen((p0) {
      if(formRegisterPhoto1().valid){
        isValidRegisterPhotoForm1(true);
      }else{
        isValidRegisterPhotoForm1(false);
      }
    });
  }
  void _initFormRegisterPhoto2() {
    formRegisterPhoto2.value=FormGroup({
      Keys.picksTarget1: FormControl<String>(validators: []),
      Keys.dueDate: FormControl<DateTime>(validators: [Validators.required]),
    }, validators: [Validators.required]);

    formRegisterPhoto2.value.valueChanges.listen((p0) {
      if(formRegisterPhoto2().valid){
        isValidRegisterPhotoForm2(true);
      }else{
        isValidRegisterPhotoForm2(false);
      }
    });
  }
  void _initFormRegisterPhoto3() {
    formRegisterPhoto3.value=FormGroup({
      Keys.picksTarget1: FormControl<String>(validators: []),
    }, validators: [Validators.required]);

    formRegisterPhoto3.value.valueChanges.listen((p0) {
      if(formRegisterPhoto3().valid){
        isValidRegisterPhotoForm3(true);
      }else{
        isValidRegisterPhotoForm3(false);
      }
    });
  }

  void _initTypeLoad() {
    typeProducts().addAll(Globals.typeProducts);
    typeProducts().add("Marcar Todos");
  }

  onHowMuchWeightChange(value) {


  }

  onFinishRegister() {
    Get.to(()=>const TrucksRegisterFinishPage());
  }

  onReturnHome() {
    Get.find<NavBarController>().onItemTapped(0);
    Get.close(4);
  }




  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedFile.value = File(pickedFile.path);
      pdfController = null;
    }
  }

}