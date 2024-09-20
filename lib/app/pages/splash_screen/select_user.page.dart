import 'package:camionesm/app/pages/splash_screen/splash_screen.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectUserPage extends  GetView<SplashScreenController>{

  const SelectUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: Obx(() => ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              _buildTitle(),
              _buildDescription(),
              _buildClientOption(),
              _buildTransportOption(),
              _buildNextButton()
            ]).paddingAll(10)));
  }

  Widget _buildTitle() {
    return CustomText(
      "¿Qué tipo de usuario eres?",
      style: titleMedium.apply(fontWeightDelta: FontWeight.w100.index, fontSizeDelta: 4),
    ).paddingOnly(bottom: 10, left: 10, right: 10);
  }

  Widget _buildDescription() {
    return RichText(
        text: TextSpan(text: 'Entendemos la importancia de conectar a los clientes con transportistas de manera eficiente.',
            style: bodyMedium,
            children: const <TextSpan>[
              TextSpan(text: 'Por eso, te invitamos a identificarte según tu rol en nuestra red.', style: TextStyle(fontWeight: FontWeight.bold))
            ])).paddingAll(10);
  }

  Widget _buildClientOption() {
    return CustomContainerOutline(
      backgroundColor: controller.typeUser() == TypeUser.client ? Globals.principalColor : null,
      onPressed: () => controller.typeUser(TypeUser.client),
      children: [
        Padding(
          padding: const EdgeInsets.all(3),
          child: CustomImageAssets(
            url: Paths.boxIcon,
            height: Get.height * 0.12,
            width: Get.width * 0.25,
            fit: BoxFit.fill)),
        CustomText("1   Cliente (Persona o empresa que envía)", style: bodyMedium.apply(fontWeightDelta: FontWeight.bold.value)),
        CustomText("Eres una persona o cliente que desea envíar.", style: bodyMedium),
      ],
    ).paddingAll(10);
  }

  Widget _buildTransportOption() {
    return CustomContainerOutline(
      backgroundColor: controller.typeUser() == TypeUser.transports ? Globals.principalColor : null,
      onPressed: () => controller.typeUser(TypeUser.transports),
      children: [
        CustomImageAssets(
          url: Paths.shopIcon,
          height: Get.height * 0.12,
          width: Get.width * 0.25,
          fit: BoxFit.fill,
        ).paddingAll(3),
        CustomText("2   Transportista (Persona que carga)", style: bodyMedium.apply(fontWeightDelta: FontWeight.bold.value)),
        CustomText("Eres una persona que lleva y trae materiales.", style: bodyMedium),
      ],
    ).paddingAll(10);
  }

  Widget _buildNextButton() {
    return CustomButton(
      title: "Siguiente",
      backgroundColor: Colors.black,
      onPressed: controller.typeUser() == TypeUser.none ? null : () => _selectPage(controller.typeUser()),
    ).paddingAll(10);
  }

  _selectPage(TypeUser typeUser){
    switch(typeUser){
      case TypeUser.client: return  Get.toNamed(Routes.homeClient);
      case TypeUser.transports: return Get.toNamed(Routes.homeTransport);
      default: throw "cliente no itentificado";
    }

  }

}