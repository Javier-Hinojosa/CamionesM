
import 'dart:io';

import 'package:camionesm/app/pages/drivers/register/driver_register_finish.page.dart';
import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdfx/pdfx.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DriverRegisterController extends GetxController{

  final formRegisterDriver=FormGroup({}).obs;
  final isValidRegisterDriverForm=false.obs;

  final formRegisterPhoto1=FormGroup({}).obs;
  final isValidRegisterPhotoForm1=true.obs;

  final formRegisterPhoto2=FormGroup({}).obs;
  final isValidRegisterPhotoForm2=true.obs;

  final isRegister = false.obs;

  var selectedFile = Rxn<File>();
  PdfController? pdfController;

  @override
  void onInit() {
    super.onInit();
    _initFormRegisterTruck();
    _initFormRegisterPhoto1();
    _initFormRegisterPhoto2();
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
  void _initFormRegisterPhoto1() {
    formRegisterPhoto1.value=FormGroup({
      Keys.picksTarget1: FormControl<String>(validators: []),
      Keys.picksTarget2: FormControl<String>(validators: []),
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
      Keys.picksTarget2: FormControl<String>(validators: []),
    }, validators: [Validators.required]);

    formRegisterPhoto2.value.valueChanges.listen((p0) {
      if(formRegisterPhoto2().valid){
        isValidRegisterPhotoForm2(true);
      }else{
        isValidRegisterPhotoForm2(false);
      }
    });
  }

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedFile.value = File(pickedFile.path);
      pdfController = null;
    }
  }

  onFinishRegister() {
    Get.to(()=>const DriverRegisterFinishPage());
  }

  onReturnHome() {
    Get.find<NavBarController>().onItemTapped(0);
    Get.close(4);
  }



}