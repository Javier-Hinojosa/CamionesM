import 'package:camionesm/app/pages/detail/petition/contract/detail_petition.contract.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPetitionSendPage extends DetailPetitionContract {
  const DetailPetitionSendPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      cardUser(context),
      SizedBox(height: Get.height * 0.02),
      CustomText("Enviaste solicitud para este envío:", style: titleMedium.apply(fontSizeDelta: 2, fontWeightDelta: FontWeight.w300.index)),
      SizedBox(height: Get.height * 0.03),
      CustomText("Detalles del envío", style: titleMedium.apply(fontWeightDelta: FontWeight.w300.index)),
      SizedBox(height: Get.height * 0.02),
      rowText(context, "Tipo de carga", "Industrial"),
      rowText(context, "Peso", "8tl"),
      SizedBox(height: Get.height * 0.02),
      cardEarnings(),
      SizedBox(height: Get.height * 0.02),
      const DottedDivider(dashSpace: 2),
      SizedBox(height: Get.height * 0.02),
      cardPointDirections(),
      SizedBox(height: Get.height * 0.03),
      CustomText("Observaciones y comentarios:", style: titleMedium.apply(fontSizeDelta: 2, fontWeightDelta: FontWeight.w300.index)),
      SizedBox(height: Get.height * 0.02),
      CustomContainerOutline(radius: 10, contentPadding: 10, children: const [
        CustomText("Cuento con diversos tipos de textiles para este envío. En su mayoría bastante delicados. Pese al embalaje solicito que no se exponga la tela.", maxLines: 10)
      ]),
      SizedBox(height: Get.height * 0.02),
      const Divider(thickness: 2),
      SizedBox(height: Get.height * 0.02),
      CustomText("Con base a tu viaje:", style: titleMedium.apply(fontSizeDelta: 2, fontWeightDelta: FontWeight.w300.index)),
      SizedBox(height: Get.height * 0.02),
      DetailPetitionContract.rowIdentify(context, Icons.history_toggle_off_outlined, "VJ010874"),
      SizedBox(height: Get.height * 0.02),
      cardMap(context),
      SizedBox(height: Get.height * 0.02),
      cardDate(),
      SizedBox(height: Get.height * 0.02),
      const CustomText("Tus datos registrados"),
      SizedBox(height: Get.height * 0.02),
      cardDriver(context),
      SizedBox(height: Get.height * 0.01),
      cardTruck(context),
      SizedBox(height: Get.height * 0.02),
      const DottedDivider(dashSpace: 1),
      SizedBox(height: Get.height * 0.02),
      const CustomText("Estatus de solicitud"),
      SizedBox(height: Get.height * 0.01),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: Get.width * 0.33,
            child: CustomButton(
                title: "Rechazada",
                onPressed: null,
                height: Get.height * 0.06,
                width: Get.width * 0.33,
                backgroundColor: Colors.black)),
        SizedBox(
            width: Get.width * 0.33,
            child: CustomButton(
                title: "Enviada",
                height: Get.height * 0.06,
                width: Get.width * 0.33,
                onPressed: (){},
                textColor: Colors.white,
                backgroundColor: Colors.black26)),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black12,
              child: Icon(Icons.delete_outline, size: 30, color: Colors.black)),
        )
      ]),
      SizedBox(height: Get.height * 0.01),
    ]);
  }
}
