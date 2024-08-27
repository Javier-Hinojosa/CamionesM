import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/nav/items/petitions/petitions.controller.dart';
import 'package:camionesm/app/pages/nav/items/petitions/petitons_list.page.dart';
import 'package:camionesm/app/pages/nav/nav_bar.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetitionsPage extends GetView<PetitionsController>{
  const PetitionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  const CustomAppBar(backgroundColor: Globals.principalColor),
      body: SingleChildScrollView(
        child: Column(children: [
          const SimpleTitleCard(CustomNotification(child: CircleAvatar(backgroundColor:Colors.white, child: Icon(Icons.mail_outline))), "Solicitudes"),
          SizedBox(height: Get.height*0.03),
          Align(alignment: Alignment.centerLeft, child: CustomText("¡Aún no cuentas con solicitudes!", style: titleLarge.apply(fontSizeDelta: -4))),
          SizedBox(height: Get.height*0.01),
          Align(alignment: Alignment.centerLeft, child: CustomText("Empieza a explorar opciones de viajes para mandar solicitudes o genera un registro de viaje para esperar solicitudes.",maxLines: 4, style: bodyMedium)),
          SizedBox(
              width: Get.width*0.8,
              height: Get.height*0.3,
              child: Image.asset(Paths.chartMail)),
          SizedBox(height: Get.height*0.03),
          CustomButton(
              backgroundColor: Colors.black,
              title: "Explorar",
              onPressed: () => Get.to(()=>const PetitionsListPage())),
          SizedBox(height: Get.height*0.02),
          CustomButton(
              backgroundColor: Globals.principalColor,
              title: "Registrar viaje",
              onPressed: () => Get.find<NavBarController>().onItemTapped(3))
        ]).paddingAll(15)));
  }



}