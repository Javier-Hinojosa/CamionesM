import 'package:camionesm/app/pages/detail/trips/contract/detail_trip.contract.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/app/widgets/textfield_pin.widget.dart';
import 'package:camionesm/app/widgets/time_line.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class DetailTripInProgressPage extends DetailTripContract {
  const DetailTripInProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          targetUser(context),
          SizedBox(height: Get.height*0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  children: [
                SizedBox(
                  width: Get.width*0.25,
                  child: CustomContainerOutline.principal(
                      radius: 15,
                      borderColor: Colors.green,
                      backgroundColor: Colors.lightGreen[200]!,
                      children: [
                    const Icon(Icons.phone,color: Colors.green),
                    CustomText("Llamar",style: titleSmall.apply(color: Colors.green))
                  ])),
                    SizedBox(width: Get.width*0.02),
                    SizedBox(
                        width: Get.width*0.25,
                        child: CustomContainerOutline.principal(
                            radius: 15,
                            borderColor: Colors.blue[900],
                            backgroundColor: Colors.blue[100]!,
                            children: [
                               Icon(FontAwesomeIcons.commentDots,color: Colors.blue[900]!.withOpacity(0.4)),
                              CustomText("Mensajear",style: titleSmall.apply(color: Colors.blue[900]!.withOpacity(0.4)))
                            ]))
                  ]),
              SizedBox(
                  width: Get.width*0.25,
                  child: CustomContainerOutline.principal(
                      radius: 15,
                      borderColor: Colors.black,
                      backgroundColor: Colors.black,
                      children: [
                        const Icon(Icons.info_outline,color: Colors.white),
                        CustomText("Soporte",style: titleSmall.apply(color: Colors.white))
                      ]))
            ]),
          SizedBox(height: Get.height*0.04),
          const DottedDivider(dashSpace: 2),
          SizedBox(height: Get.height*0.04),
          CustomText("Detalles del viaje", style: titleMedium.apply(fontSizeDelta: 2)),
          SizedBox(height: Get.height*0.02),
          targetLocations(context),
          SizedBox(height: Get.height*0.04),
          CustomText("Observaciones y comentarios", style: titleMedium.apply(fontSizeDelta: 2)),
          SizedBox(height: Get.height*0.02),
          CustomContainerOutline(
              contentPadding: 10,
              radius: 15,
              backgroundColor: Colors.white,
              children: const [
                CustomText("Cuento con diversos tipos de textiles para este envío. En su mayoría bastante delicados. Pese al embalaje solicito que no se exponga la tela.",
                    textAlign: TextAlign.start,
                    maxLines: 10)
              ]),
          SizedBox(height: Get.height*0.02),
          CustomContainer(child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(Paths.papers,
                      width: Get.width*0.3,
                      fit: BoxFit.cover)),
              SizedBox(width: Get.width*0.02),
              Flexible(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText("Registro de productos",style: bodyLarge.apply(color:  Theme.of(context).disabledColor)),
                  const CustomText("Industrial, Telas Nylon...  , 8tl",maxLines: 3),
                  rowText(context, "ID ", "PR01284",color: Theme.of(context).disabledColor)
                ]))
            ])),
          SizedBox(height: Get.height*0.02),
          const DottedDivider(dashSpace: 2),
          SizedBox(height: Get.height*0.03),
          CustomText("Estatus de viaje", style: titleMedium.apply(fontSizeDelta: 2)),
          SizedBox(height: Get.height*0.02),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 1,
                child: CustomTimeLine(items: [
                  BuildTimelineTile(text: "03 Abr 2024  08:14",subtitle: "Recolección correcta", isActive: true),
                  BuildTimelineTile(text: "05 Abr 2024  08:14",subtitle: "Entrega estimada del envio", isActive: true)
                ])),
              Flexible(
                  child: CustomButton.withoutBorder(
                      title: "Viaje iniciado",
                      width: Get.width*0.35))
            ]),
          SizedBox(height: Get.height*0.02),
          CustomText("Carta Porte de viaje", style: titleMedium.apply(fontSizeDelta: 2)),
          SizedBox(height: Get.height*0.02),
          Row(
            children: [
              Flexible(
                child: CustomText("La carta porte se encuentra ya disponible para descargar.",
                    style: bodyLarge.apply(
                    fontSizeDelta: -2,
                    color: Theme.of(context).disabledColor))),
              SizedBox(
                width: Get.width*0.09,
                height: Get.height*0.05,
                child: const CustomIconButton(
                    icon: Icons.cloud_download_outlined,
                    backgroundColor: Globals.principalColor))
            ]),
          SizedBox(height: Get.height*0.02),
          const DottedDivider(dashSpace: 2),
          SizedBox(height: Get.height*0.02),
          const CustomText(
              "Para finalizar tu viaje, se te solicitará el código de verificación que el cliente te proporcionará una vez que la carga se haya hecho satisfactoriamente.",
              maxLines: 6,
              style: TextStyle(fontWeight: FontWeight.w800)),
          SizedBox(height: Get.height*0.02),
          Center(
            child: SizedBox(
                width: Get.width*0.9,
                child: CustomButton(
                    title: "Finalizar",
                    onPressed: ()=>_dialogPass(context),
                    backgroundColor: Colors.black)))
        ]);
  }


  Future<bool> _dialogPass(BuildContext context){
    return DialogUtils.dialog(child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
              width: Get.width*0.3,
              height: Get.height*0.16,
              child: CircleAvatar(
                  backgroundColor: Theme.of(context).disabledColor.withOpacity(0.1),
                  radius: 30,
                  child: CustomImageAssets(
                      width: Get.width*0.14,
                      height: Get.height*0.07,
                      url: Paths.padlock).paddingAll(10))),
          SizedBox(height: Get.height*0.02),
          CustomText("Ingresa el códio de verificación", style: titleLarge,textAlign: TextAlign.center),
          CustomPinTextField(controller.textEditingPinLock()),
          CustomText("Una vez que la descarga del envío se haya realizado exitosamente, deberás proporcionar el código de verificación para finalizar tu viaje.",
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
              child: Image.asset(Paths.invoice).paddingAll(10)),
          SizedBox(height: Get.height*0.02),
          CustomText("¡Viaje completado exitosamente!", style: titleLarge,textAlign: TextAlign.center),
          CustomText("El viaje se completó y registró exitosamente. A continuación emite tu factura para el cobro de servicio",
              maxLines: 4,
              style: bodyMedium,
              textAlign: TextAlign.start).paddingAll(10),
          SizedBox(height: Get.height*0.02),
          CustomButton(
              title: "Emitir factura",
              onPressed: () =>Get.toNamed(Routes.invoice),
              backgroundColor: Globals.principalColor).paddingOnly(left: 10, right: 10),
          SizedBox(height: Get.height*0.02)
        ]));
  }


}
