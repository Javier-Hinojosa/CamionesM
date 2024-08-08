import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/nav/items/truks/truck.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TrucksPage extends GetView<TrucksController>{
   TrucksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Globals.principalColor,
        trailing: [
          SizedBox(
            width: Get.width*0.15,
            child: const CustomIconButton(icon: FontAwesomeIcons.sliders).paddingAll(6))
        ]),
      body:  Column(children: [
        const SimpleTitleCard(CircleAvatar(backgroundColor:Colors.white, child: Icon(Icons.local_shipping_outlined)), "Mis Vehiculos"),
        Align(alignment: Alignment.centerLeft, child: CustomText("¡Empezar registro!", style: titleLarge.apply(fontSizeDelta: -4)))
      ]).paddingAll(20));
  }


}