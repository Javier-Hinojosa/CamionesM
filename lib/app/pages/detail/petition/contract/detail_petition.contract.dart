import 'package:camionesm/app/pages/detail/petition/detail_petition.page.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DetailPetitionContract extends DetailPetitionPage{
  const DetailPetitionContract({super.key});

  static Widget customTextRow(BuildContext context, String title, String subtitle, {
    double fontSizeDeltaTitle=-6,
    double fontSizeSubtitle=13,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    Color? color}) {
    return Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          CustomText(title, style: titleMedium.apply(
              color: color,
              fontSizeDelta: fontSizeDeltaTitle,
              fontWeightDelta: FontWeight.w300.index)),
          SizedBox(width: Get.width * 0.01),
          CustomText(subtitle, style:TextStyle(color: color, fontSize: fontSizeSubtitle))
        ]);
  }

  static Widget rowIdentify(BuildContext context, IconData icon, String id){
    return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        SizedBox(
        width: Get.width*0.22,
        height: Get.height*0.045,
        child: Card(
            color: Globals.principalColor,
            child: Icon(icon,color: Colors.black,size: 28))),
          customTextRow(context, "ID", id,
              mainAxisAlignment: MainAxisAlignment.end)
        ]);

  }

}