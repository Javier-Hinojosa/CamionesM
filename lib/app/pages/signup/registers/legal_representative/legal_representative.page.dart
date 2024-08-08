import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/signup/registers/legal_representative/legal_representative.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LegalRepresentativePage extends GetView<LegalRepresentativeController> {
  const LegalRepresentativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SimpleTitleCard(
                  Paths.briefcase, "Datos de Representante Legal"),
              ReactiveForm(
                  formGroup: controller.form(),
                  child: Column(children: [
                    CustomReactiveTextField(Keys.name,
                        labelText: "Nombre/s",
                        hintText: "Ingresa tu nombre",
                        keyboard: TextInputType.text),
                    CustomReactiveTextField(Keys.lastName,
                        labelText: "Apellidos",
                        hintText: "Ingresa tus Apellidos",
                        keyboard: TextInputType.emailAddress),
                    CustomReactiveTextField(Keys.rfcLR,
                        labelText: "RFC",
                        hintText: "Ingresa tu RFC",
                        keyboard: TextInputType.text),
                    SizedBox(
                      height: Get.height * .05,
                    )
                  ])),
              Obx(() => CustomButton(
                      title: "Siguiente",
                      onPressed: controller.isValid()
                          ? () => controller.onFinish()
                          : null,
                      color: Colors.black)
                  .paddingAll(10))
            ]).paddingAll(15));
  }

}
