import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register.controller.dart';
import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register_photo.page.dart';
import 'package:camionesm/app/pages/nav/items/truks/widgets/step_progress_truck.widget.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TrucksRegisterSpecificPage extends GetView<TrucksRegisterController>{
  const TrucksRegisterSpecificPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leadingColor: Theme.of(context).scaffoldBackgroundColor,backgroundColor: Globals.principalColor),
      bottomSheet: _customBottom(context),
      body: SingleChildScrollView(
        child: Column(children: [
          Align(alignment: Alignment.centerLeft, child: CustomText("Datos específicos", style: titleLarge.apply(fontSizeDelta: -4))),
          Align(alignment: Alignment.centerLeft, child: CustomText("No te mortifiques, posteriormente en la sección de “Mis camiones” podrás editar o agregar nueva información si lo deseas.", style: bodyMedium)),
          SizedBox(height: Get.height*0.02),
          ReactiveForm(
              formGroup: controller.formRegisterSpecific(),
            child: Column(children: [
              CustomReactiveTextField(Keys.truckPlate,labelText: "Placa de camión*",hintText: "Ej:WXI-986"),
              CustomReactiveTextField(Keys.trailerPlate,labelText: "Placa de remolque*",hintText: "Ej:WXI-986"),
              CustomReactiveTextField(Keys.trailerPlate2,labelText: "Placa de remolque2*",hintText: "Ej:WXI-986"),
              CustomReactiveTextField(Keys.sct,labelText: "No. Perm SCT*",hintText: "Ej:0000"),
              CustomReactiveTextField(Keys.responsibleInsurer,labelText: "Aseguradora responsable",hintText: "Ej:Qualitas"),
              CustomReactiveTextField(Keys.noPolicy,labelText: "No.poliza",hintText: "Ej:123456"),
            ])),
          SizedBox(height: Get.height*0.18)
        ]).paddingAll(20)));
  }
  Widget _customBottom(BuildContext context) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(20),
        height: Get.height*0.2,
        child: ListView(
            shrinkWrap: true,
            children: [
              const CustomProgressStepTruck(isActive: [false,true,false]),
              SizedBox(height: Get.height*0.02),
              Obx(()=> SizedBox(
                    height: Get.height*0.06,
                    width: Get.width*0.2,
                    child: CustomButton(
                        title: "Siguiente",
                        height: Get.height * 0.02,
                        width: Get.width * 0.2,
                        backgroundColor: Colors.black,
                        onPressed: controller.isValidRegisterSpecificForm()
                            ? () => Get.to(()=>const TrucksRegisterPhotoPage())
                            : null)),
              )
            ])
    );
  }

}