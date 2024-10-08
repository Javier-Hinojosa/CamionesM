import 'package:camionesm/app/pages/signup/signup.controller.dart';
import 'package:camionesm/app/pages/signup/signup3.page.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUp2Page extends GetView<SingUpController> {
  const SingUp2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: Obx(() => ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomText(
                          "Por favor, selecciona el tipo de usuario que mejor te represente",
                          style: titleMedium.apply(
                              fontWeightDelta: FontWeight.w100.index,
                              fontSizeDelta: 4))
                      .paddingOnly(bottom: 10, left: 10, right: 10),
                  CustomText(
                          'Seleccionar tu tipo de usuario nos ayudará a brindarte una experiencia personalizada y adaptada a tus necesidades específicas.',
                          style: bodyMedium)
                      .paddingAll(10),
                  CustomContainerOutline(
                      backgroundColor: controller.signUpModel.typePerson() ==
                              TypePerson.physicalPerson
                          ? Globals.principalColor
                          : null,
                      onPressed: () => controller.signUpModel
                          .typePerson(TypePerson.physicalPerson),
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(3),
                            child: CustomImageAssets(
                                url: Paths.personIcon,
                                height: Get.height * 0.12,
                                width: Get.width * 0.2,
                                fit: BoxFit.fill)),
                        CustomText("Persona Física",
                            style: bodyMedium.apply(
                                fontWeightDelta: FontWeight.bold.value)),
                        CustomText(
                            "Eres un individuo único con necesidades y características propias.",
                            style: bodyMedium,
                            textAlign: TextAlign.center)
                      ]).paddingAll(10),
                  CustomContainerOutline(
                      backgroundColor: controller.signUpModel.typePerson() ==
                              TypePerson.moralPerson
                          ? Globals.principalColor
                          : null,
                      onPressed: () => controller.signUpModel
                          .typePerson(TypePerson.moralPerson),
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(3),
                            child: CustomImageAssets(
                                url: Paths.officeBag,
                                height: Get.height * 0.12,
                                width: Get.width * 0.2,
                                fit: BoxFit.fill)),
                        CustomText("Persona Moral",
                            style: bodyMedium.apply(
                                fontWeightDelta: FontWeight.bold.value)),
                        CustomText(
                            "Representas una entidad legal, como una empresa, organización o institución, con su propia identidad y objetivos.",
                            style: bodyMedium,
                            maxLines: 3,
                            textAlign: TextAlign.center)
                      ]).paddingAll(10),
                  CustomButton(
                          title: "Siguiente",
                          onPressed: controller.signUpModel.typePerson() ==
                                  TypePerson.none
                              ? null
                              : () => Get.to(() => const SingUp3Page()),
                          backgroundColor: Colors.black)
                      .paddingAll(10)
                ]).paddingAll(15)));
  }
}
