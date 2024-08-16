import 'dart:io';
import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register_finish.page.dart';
import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/services/country/country.contract.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdfx/pdfx.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TripRegisterController extends GetxController{
  final ICountryService iCountryService;

  final formRegisterTrip=FormGroup({}).obs;
  final isValidRegisterTripForm=false.obs;

  final RxList<String> states = <String>[].obs;
  final Map<String, List<String>> municipals = {};
  final RxList<String> municipalsOriginSelect = <String>[].obs;
  final RxList<String> municipalsDestinySelect = <String>[].obs;

  final typeProducts= <String>[].obs;

  var selectedFile = Rxn<File>();
  PdfController? pdfController;

  TripRegisterController(this.iCountryService);


  @override
  void onInit() async{
    super.onInit();
    _initFormRegisterTruck();
    await _getStates();
  }

  @override
  void onClose() {
    pdfController?.dispose();
    super.onClose();
  }

  void _initFormRegisterTruck(){
    formRegisterTrip.value=FormGroup({
      Keys.truck: FormControl<String>(validators: [Validators.required]),
      Keys.driver: FormControl<String>(validators: [Validators.required]),

      Keys.stateOrigin: FormControl<String>(validators: [Validators.required]),
      Keys.municipalOrigin: FormControl<String>(validators: [Validators.required]),
      Keys.cpOrigin: FormControl<String>(validators: [Validators.required]),
      Keys.dateOrigin: FormControl<DateTime>(validators: [Validators.required]),
      Keys.hourOrigin: FormControl<String>(validators: [Validators.required]),

      Keys.stateDestiny: FormControl<String>(validators: [Validators.required]),
      Keys.municipalDestiny: FormControl<String>(validators: [Validators.required]),
      Keys.cpDestiny: FormControl<String>(validators: [Validators.required]),
      Keys.dateDestiny: FormControl<DateTime>(validators: [Validators.required]),
      Keys.hourDestiny: FormControl<String>(validators: [Validators.required])
    }, validators: [Validators.required]);

    formRegisterTrip.value.valueChanges.listen((p0) {
      if(formRegisterTrip().valid){
        isValidRegisterTripForm(true);
      }else{
        isValidRegisterTripForm(false);
      }
    });
  }

  Future<void> _getStates () async {
    var states=  await iCountryService.getStates();
    this.states(states.keys.toList());
    municipals.addAll(states);
  }
  onChangeStateOrigin(String e) {
    municipalsOriginSelect(municipals[e]!.toList());
    print(municipalsOriginSelect.map((element) => element));
    municipalsOriginSelect.refresh();
  }
  onChangeStateDestiny(String e) {
    municipalsDestinySelect(municipals[e]!.toList());
  }

  onFinishRegister() {
    Get.to(()=>const TrucksRegisterFinishPage());
  }

  onReturnHome() {
    Get.find<NavBarController>().onItemTapped(0);
    Get.close(4);
  }


  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      selectedFile.value = File(result.files.single.path!);
      if (selectedFile.value!.path.endsWith('.pdf')) {
        pdfController = PdfController(document: PdfDocument.openFile(selectedFile.value!.path));
      } else {
        pdfController = null;
      }
    }
  }

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedFile.value = File(pickedFile.path);
      pdfController = null;
    }
  }

}