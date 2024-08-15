import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_loading.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCustomTransportItem extends StatelessWidget {
  const MyCustomTransportItem(
      {super.key, this.onDetail, this.onEdit, this.onDelete});

  final void Function()? onDetail;
  final void Function()? onEdit;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
            backgroundColor: Colors.white.withOpacity(1.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText("ID", style: titleMedium.apply(fontWeightDelta: FontWeight.w300.index)),
                        SizedBox(width: Get.width * 0.01),
                        const CustomText("TR01284")]),
                  SizedBox(height: Get.height * 0.02),
                  CustomContainerLoading.image(context, height: Get.height * 0.13, path: Paths.truck2),
                  SizedBox(height: Get.height * 0.02),
                  CustomContainerOutline(
                      radius: 20,
                      contentPadding: 20,
                      children:  [_customTextColumn(context,"Tipo de camión","C2 Camion Unitario (2 llantas en el eje delantero y 4 llantas en el eje trasero)")]),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                            width: Get.width*0.35,
                            child: _customTextColumn(context,"Marca","Volvo")),
                        CustomContainer(
                            width: Get.width*0.32,
                            child: _customTextColumn(context,"Año","2009"))
                      ]),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: Get.height*0.05,
                            width: Get.width*0.5,
                            child: CustomButton(
                                title: "Ver detalles",
                                height: Get.height*0.05,
                                width: Get.width*0.4,
                                onPressed: onDetail,
                                backgroundColor: Globals.principalColor)),
                         Row(
                          children: [
                            GestureDetector(
                              onTap: onEdit,
                              child:  CircleAvatar(
                                  backgroundColor: Theme.of(context).disabledColor.withOpacity(0.1),
                                  child: const Icon(Icons.edit_outlined))),
                            SizedBox(width: Get.width*0.01),
                            GestureDetector(
                                onTap: onDelete,
                                child:  CircleAvatar(
                                    backgroundColor: Theme.of(context).disabledColor.withOpacity(0.1),
                                    child: const Icon(Icons.delete_outline_outlined)))
                          ])
                      ])
                ]).paddingAll(5)).paddingOnly(top: 10,bottom: 10);
  }

  Widget _customTextColumn(BuildContext context, String title, String subtitle, {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment, children: [
       CustomText(title,style: const TextStyle(fontSize: 16)),
      SizedBox(height: Get.height*0.01),
      CustomText(subtitle,maxLines: 1,style: headlineLarge.apply(fontSizeDelta: -13,fontWeightDelta: FontWeight.w200.index))
    ]);
  }
}
