import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register.controller.dart';
import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register_specific.page.dart';
import 'package:camionesm/app/pages/nav/items/truks/widgets/step_progress_truck.widget.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_dropdown_field.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TrucksRegisterGeneralPage extends GetView<TrucksRegisterController>{
  const TrucksRegisterGeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Scaffold(
          appBar: CustomAppBar(leadingColor: Theme.of(context).scaffoldBackgroundColor,backgroundColor: Globals.principalColor),
          bottomSheet: _customBottom(context),
          body: SingleChildScrollView(
          child: Column(children: [
            Align(alignment: Alignment.centerLeft, child: CustomText("¡Registra un nuevo camión!", style: titleLarge.apply(fontSizeDelta: -4))),
            Align(alignment: Alignment.centerLeft, child: CustomText("Llena el formulario para agregar un nuevo camión", style: bodyMedium)),
            const Divider(thickness: 2),
            Align(alignment: Alignment.centerLeft, child: CustomText("Datos generales", style: headlineLarge.apply(fontSizeDelta: -6))),
            SizedBox(height: Get.height*0.02),
            ReactiveForm(
              formGroup: controller.formRegisterTruck(),
              child: Column(
                children: [
                  _customTextFieldSearch(Keys.typeTruck,"Tipo de camión","Elije el tipo de camión",["Carga"],(p0) {}),
                 SizedBox(height: Get.height*0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex:5,
                          child: _customTextFieldSearch(Keys.brand,"Marca","Elije la marca",["Man","Volvo"],(p0) {})),
                      const Spacer(),
                      Flexible(
                          flex:4,
                          child: _customTextFieldSearch(Keys.year,"Año","Elije el año",["2024","2018"],(p0) {}))
                    ]),
                  SizedBox(height: Get.height*0.02),
                  CustomReactiveTextField(Keys.howMuchWeight,labelText: "Cuánto peso puede llevar", hintText: "Ej:11,000 KG",paddingAll: 0,onChanged: (p0) => controller.onHowMuchWeightChange(p0.value), keyboard: const TextInputType.numberWithOptions()),
                  SizedBox(height: Get.height*0.02),
                  const Align(alignment: Alignment.centerLeft,child: Text("Tipo de carga",style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                  Align(alignment: Alignment.centerLeft, child: CustomText("Selecciona una o varias opciones que desees aceptar en tu camión", style: bodyMedium)),
                  SizedBox(height: Get.height*0.02),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.typeProducts.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 40),
                      primary: false,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) =>
                          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                            Checkbox(value: false, onChanged: (d) {}),
                            Expanded(
                                child: CustomText(controller.typeProducts[index],
                                    maxLines: 1, style: titleMedium))
                          ])),
                  SizedBox(height: Get.height*0.02),
                   const Align(alignment: Alignment.centerLeft,child: Text("Carga tipo Agrícola",style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w400))),
                  SizedBox(height: Get.height*0.02),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.typeProducts.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 40),
                      primary: false,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) =>
                          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                            Checkbox(value: false, onChanged: (d) {}),
                            Expanded(
                                child: CustomText(controller.typeProducts[index],
                                    maxLines: 1, style: titleMedium))
                          ])),
                  SizedBox(height: Get.height*0.2)
                ])
            )

          ]).paddingAll(20)
        )
      ));
  }

  Widget _customTextFieldSearch(String key,String labelText, String hintText, List items, void Function(FormControl<dynamic>)? onChanged ) {
    return  CustomReactiveDropDown(key,
        paddingAll: 0,
        labelText: labelText,
        hintText: hintText,
        onChanged: (p0) => onChanged,
        items: items
            .map((e) =>
            DropdownMenuItem(value: e, child: Text(e)))
            .toList());
  }

 Widget _customBottom(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(20),
      height: Get.height*0.2,
      child: ListView(
        shrinkWrap: true,
        children: [
          const CustomProgressStepTruck(isActive: [true,false,false]),
          SizedBox(height: Get.height*0.02),
          SizedBox(
            height: Get.height*0.06,
            width: Get.width*0.2,
            child: CustomButton(
                title: "Siguiente",
                height: Get.height * 0.02,
                width: Get.width * 0.2,
                backgroundColor: Colors.black,
                onPressed: controller.isValidRegisterTruckForm()
                    ? () => Get.to(()=>const TrucksRegisterSpecificPage())
                    : null))
        ])
    );
  }

}