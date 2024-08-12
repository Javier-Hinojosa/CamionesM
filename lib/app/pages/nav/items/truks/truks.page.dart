import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/nav/items/truks/truck.controller.dart';
import 'package:camionesm/app/pages/nav/items/truks/trucks_register_general.page.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TrucksPage extends GetView<TrucksController>{
   const TrucksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Globals.principalColor,
        leadingColor: Theme.of(context).scaffoldBackgroundColor,
        trailing: [
          SizedBox(
            width: Get.width*0.15,
            child: const CustomIconButton(icon: FontAwesomeIcons.sliders).paddingAll(6))
        ]),
      body:  Column(children: [
        const SimpleTitleCard(CustomNotification(child: CircleAvatar(backgroundColor:Colors.white, child: Icon(Icons.local_shipping_outlined))), "Mis Camiones"),
        SizedBox(height: Get.height*0.03),
        Align(alignment: Alignment.centerLeft, child: CustomText("¡Empezar registro!", style: titleLarge.apply(fontSizeDelta: -4))),
        SizedBox(height: Get.height*0.01),
        Align(alignment: Alignment.centerLeft, child: CustomText("Maximiza tu eficiencia y gana más con cada kilómetro. ¡Empieza a registrar a el camión/es de tus viajes!",maxLines: 4, style: bodyMedium)),
        SizedBox(
          width: Get.width*0.8,
          height: Get.height*0.3,
          child: Image.asset(Paths.clipboardTruck)),
        SizedBox(height: Get.height*0.03),
        CustomButton(title: "Registrar",onPressed: ()=>Get.to(()=>const TrucksRegisterGeneralPage()),color: Globals.principalColor)
      ]).paddingAll(15));
  }


}