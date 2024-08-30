import 'package:camionesm/app/pages/detail/petition/contract/detail_petition.contract.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container_loading.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/app/widgets/textfield_pin.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetailPetitionApprovePage extends DetailPetitionContract {
  const DetailPetitionApprovePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText("Detalles del viaje", style: titleMedium.apply(fontSizeDelta: 2,fontWeightDelta: FontWeight.w300.index)),
        SizedBox(height: Get.height * 0.01),
        const DottedDivider(dashSpace: 1),
        SizedBox(height: Get.height * 0.01),
        CustomText("Puebla a CDMX", style: titleMedium),
        SizedBox(height: Get.height * 0.015),
        cardDate(),
        SizedBox(height: Get.height * 0.02),
        cardPointDirections(),
        SizedBox(height: Get.height * 0.03),
        cardDriver(context),
        SizedBox(height: Get.height * 0.02),
        cardTruck(context),
        SizedBox(height: Get.height * 0.02),
        const Divider(thickness: 2),
        SizedBox(height: Get.height * 0.02),
        CustomText("Detalles del envío", style: titleMedium.apply(fontSizeDelta: 2,fontWeightDelta: FontWeight.w300.index)),
        SizedBox(height: Get.height * 0.01),
        CustomContainerLoading.image(context, height: Get.height * 0.15, path: Paths.papers),
        SizedBox(height: Get.height * 0.01),
        cardUser(context),
        SizedBox(height: Get.height * 0.02),
        DetailPetitionContract.customTextRow(context, "Tipo de Carga", "Industrial",
            fontSizeDeltaTitle: -2,
            fontSizeSubtitle: 18,
            mainAxisAlignment: MainAxisAlignment.spaceBetween),
        SizedBox(height: Get.height * 0.01),
        DetailPetitionContract.customTextRow(context, "Peso", "8tl",
            fontSizeDeltaTitle: -2,
            fontSizeSubtitle: 18,
            mainAxisAlignment: MainAxisAlignment.spaceBetween),
        SizedBox(height: Get.height * 0.03),
        CustomText("Observaciones y comentarios:", style: titleMedium.apply(fontSizeDelta: 2,fontWeightDelta: FontWeight.w300.index)),
        SizedBox(height: Get.height * 0.02),
        CustomContainerOutline(
            radius: 10,
            contentPadding: 10,
            children: const [
              CustomText("Cuento con diversos tipos de textiles para este envío. En su mayoría bastante delicados. Pese al embalaje solicito que no se exponga la tela.", maxLines: 10)
            ]),
        SizedBox(height: Get.height * 0.02),
        cardEarnings(),
        SizedBox(height: Get.height * 0.02),
        const DottedDivider(dashSpace: 1),
        SizedBox(height: Get.height * 0.02),
        CustomText("Carta Porte de viaje", style: titleMedium.apply(fontSizeDelta: 2,fontWeightDelta: FontWeight.w300.index)),
        SizedBox(height: Get.height * 0.01),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(child: CustomText("La carta porte se encuentra ya disponible para descargar. (formato sin timbrar pre) ", maxLines: 4)),
            CustomIconButton(backgroundColor: Globals.principalColor,
            width: Get.width*0.14,
            icon: Icons.cloud_download_outlined)
          ]),
        SizedBox(height: Get.height * 0.02),
        const CustomText("Al iniciar tu viaje, se te solicitará el código de verificación que el cliente te proporcionará una vez que la carga se haya hecho satisfactoriamente.",
            maxLines: 5,
            style: TextStyle(fontWeight: FontWeight.w800)),
        SizedBox(height: Get.height * 0.02),
        Center(
          child: CustomButton(title: "Iniciar viaje",
          width: Get.width*0.7,
            height: Get.height*0.065,
            backgroundColor: Globals.principalColor,
            onPressed: ()=>_dialogPass(context))),
        SizedBox(height: Get.height * 0.02),
      ]);
  }

  Future<bool> _dialogPass(BuildContext context){
      return DialogUtils.dialog(child: ListView(
          shrinkWrap: true,
          children: [
              SizedBox(
                  width: Get.width*0.4,
                  height: Get.height*0.16,
                  child: CircleAvatar(
                      backgroundColor: Theme.of(context).disabledColor.withOpacity(0.1),
                      radius: 30,
                      child: CustomImageAssets(
                          width: Get.width*0.15,
                          height: Get.height*0.07,
                          url: Paths.padlock).paddingAll(10))),
              SizedBox(height: Get.height*0.02),
              CustomText("Ingresa el códio de verificación", style: titleLarge,textAlign: TextAlign.center),
              CustomPinTextField(controller.textEditingPinLock()),
              CustomText("Una vez que la carga del envío se haya realizado exitosamente, deberás proporcionar el código de verificación para iniciar y confirmar tu viaje.",
                  maxLines: 5,
                  style: bodyMedium,
                  textAlign: TextAlign.start).paddingAll(10),
              SizedBox(height: Get.height*0.02),
              CustomButton(
                  title: "Confirmar",
                  onPressed: () {Get.back();_onDialogSuccess(context);},
                  backgroundColor: Globals.principalColor).paddingOnly(left: 20, right: 20),
              SizedBox(height: Get.height*0.02)
          ]));

  }

  Future<bool> _onDialogSuccess(BuildContext context) {
      return DialogUtils.dialog(
          child: ListView(shrinkWrap: true, children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(Paths.circleCheck).paddingAll(10)),
              SizedBox(height: Get.height*0.02),
              CustomText("¡El viaje se ha iniciado exitosamente!", style: titleLarge, maxLines: 3, textAlign: TextAlign.center),
              CustomText("A través de “Mis solicitudes” podrás ver el estatus de la solicitud realizada.",
                  maxLines: 4,
                  style: bodyMedium,
                  textAlign: TextAlign.start).paddingAll(10),
              SizedBox(height: Get.height*0.02),
              CustomButton(
                  title: "Ir a mis solicitudes",
                  onPressed: () =>DialogUtils.closeDialog(),
                  backgroundColor: Globals.principalColor).paddingOnly(left: 10, right: 10),
              SizedBox(height: Get.height*0.02)
          ])).whenComplete(()=>Get.close(1));
  }


}
