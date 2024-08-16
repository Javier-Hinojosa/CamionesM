import 'package:camionesm/app/pages/drivers/register/driver_register.controller.dart';
import 'package:camionesm/app/pages/drivers/register/driver_register_photo.page.dart';
import 'package:camionesm/app/pages/drivers/widgets/step_progress_driver.widget.dart';
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

class DriverRegisterGeneralPage extends GetView<DriverRegisterController> {
  const DriverRegisterGeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(leadingColor: Theme.of(context).scaffoldBackgroundColor,backgroundColor: Globals.principalColor),
        body:  SingleChildScrollView(
          child: Column(
              children: [
                Align(alignment: Alignment.centerLeft, child: CustomText("¡Registra un conductor!", style: titleLarge.apply(fontSizeDelta: -4))),
                Align(alignment: Alignment.centerLeft, child: CustomText("Llena el formulario para agregar un nuevo conductor", style: bodyMedium)),
                const Divider(thickness: 2),
                Align(alignment: Alignment.centerLeft, child: CustomText("Datos generales", style: headlineLarge.apply(fontSizeDelta: -6))),
                SizedBox(height: Get.height*0.02),
                ReactiveForm(formGroup: controller.formRegisterDriver(),
                    child: Column(
                      children: [
                        CustomReactiveTextField(Keys.name,
                        labelText: "Nombre/s",
                        paddingAll: 0,

                        hintText: "Escribe tu Nombre"),
                        SizedBox(height: Get.height*0.02),
                        CustomReactiveTextField(Keys.lastName,
                            labelText: "Apellido/s",
                            paddingAll: 0,
                            hintText: "Escribe tus apellidos"),
                        SizedBox(height: Get.height*0.02),
                        CustomReactiveTextField(Keys.phone,
                            paddingAll: 0,
                            labelText: "Teléfono",
                            hintText: "Escribe tu número teléfonico"),
                        SizedBox(height: Get.height*0.02),
                        CustomReactiveTextField(Keys.rfc,
                            paddingAll: 0,
                            labelText: "RFC",
                            hintText: "Escribe tu RFC")
                      ])),
                SizedBox(height: Get.height*0.04),
                Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    height: Get.height*0.2,
                    child: ListView(
                        shrinkWrap: true,
                        children: [
                          const CustomProgressStepDriver(isActive: [true,false]),
                          SizedBox(height: Get.height*0.02),
                          Obx(()=>
                              SizedBox(
                                  height: Get.height*0.06,
                                  width: Get.width*0.2,
                                  child: CustomButton(
                                      title: "Siguiente",
                                      height: Get.height * 0.02,
                                      width: Get.width * 0.2,
                                      backgroundColor: Colors.black,
                                      onPressed: controller.isValidRegisterDriverForm()
                                          ? () => Get.to(()=>const DriverRegisterPhotoPage()) : null)))
                        ]))
              ]).paddingAll(15),
        ));
  }

  
}
