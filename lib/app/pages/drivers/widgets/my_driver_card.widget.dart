import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/common/extensors.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDriverCard extends StatelessWidget {
  const MyDriverCard(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText("ID", style: titleMedium.apply(fontWeightDelta: FontWeight.w300.index)),
                        SizedBox(width: Get.width * 0.01),
                        const CustomText("CN010874")]),
                  SizedBox(height: Get.height * 0.02),
                  Center(
                    child: CustomImageAssets(
                        url: Paths.profile3,
                        height: Get.height * 0.12,
                        width: Get.width * 0.27,
                        fit: BoxFit.fill)),
                  SizedBox(height: Get.height * 0.02),
                  SizedBox(
                    width: Get.width,
                    child: CustomContainerOutline(
                      backgroundColor: Colors.white,
                        radius: 20,
                        contentPadding: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          _customTextColumn(context,"Nombre","Jorge Martínez L.")
                        ])),
                  SizedBox(height: Get.height * 0.02),
                  SizedBox(
                      width: Get.width,
                      child: CustomContainerOutline(
                          backgroundColor: Colors.white,
                          radius: 20,
                          contentPadding: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            _customTextColumn(context,"Teléfono","+525523256867".formatPhoneNumber())
                          ])),
                  SizedBox(height: Get.height * 0.02),
                  CustomContainer(
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        SizedBox(width: Get.width * 0.03),
                        const Icon(Icons.star_rate_rounded, color: Colors.black, size: 18),
                        const CustomText("4.3",style: TextStyle(fontWeight:  FontWeight.bold)),
                        SizedBox(width: Get.width * 0.03),
                        CustomText("Entregas positivas",style: bodyMedium.apply(color: Colors.black))
                      ])),
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
