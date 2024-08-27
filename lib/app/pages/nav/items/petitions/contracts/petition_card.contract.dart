import 'package:camionesm/app/pages/nav/items/petitions/petitons_list.page.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PetitionCardContract extends PetitionsListPage {

  const PetitionCardContract({super.key});

  static Widget rowIdentify(BuildContext context, IconData icon, String id){
    return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: Get.width * 0.22,
              height: Get.height * 0.04,
              child:  CustomIconButton(
                  icon: icon,
                  backgroundColor: Colors.black)),
          customTextRow(context, "ID", id,
              mainAxisAlignment: MainAxisAlignment.end)
        ]);

  }

  static Widget customTextRow(BuildContext context, String title, String subtitle, {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center, Color? color}) {
    return Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          CustomText(title, style: titleMedium.apply(
              color: color,
              fontSizeDelta: -2,
              fontWeightDelta: FontWeight.w300.index)),
          SizedBox(width: Get.width * 0.01),
          CustomText(subtitle, style:TextStyle(color: color, fontSize: 14))
    ]);
  }
}
