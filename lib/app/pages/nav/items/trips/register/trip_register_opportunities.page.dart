import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/nav/items/trips/register/trip_register.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TripRegisterOpportunitiesPage  extends GetView<TripRegisterController>{
  const TripRegisterOpportunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: const CustomAppBar(backgroundColor: Globals.principalColor),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SimpleTitleCard(CustomNotification(child: CircleAvatar(backgroundColor:Colors.white, child: Icon(Icons.flag_outlined))), "Registrar nuevo viaje"),
                  SizedBox(height: Get.height*0.01),
                  const CircleAvatar(
                      radius: 28,
                      backgroundColor: Globals.principalColor,
                      child: Icon(FontAwesomeIcons.mapPin,size: 30)),
                  SizedBox(height: Get.height*0.02),
                  Align(alignment: Alignment.centerLeft, child: CustomText("Crea otras oportunidades en tu viaje de regreso", maxLines: 3, style: titleLarge.apply(fontSizeDelta: -4))),
                  SizedBox(height: Get.height*0.01),
                  const Divider(thickness: 2),
                  Align(alignment: Alignment.centerLeft, child: CustomText("Crea más viajes con los “Viajes alternos”", maxLines: 3, style: bodyLarge.apply(fontWeightDelta: FontWeight.w300.index))),
                  SizedBox(height: Get.height*0.01),
                  Align(alignment: Alignment.centerLeft, child: CustomText("Puedes crear opciones de ruta alternas dentro de tu viaje de regreso para ampliar tus posibilidades en las búsquedas.", maxLines: 3, style: bodyMedium.apply( fontSizeDelta: 1))),
                  SizedBox(height: Get.height*0.02),
                  SizedBox(
                      width: Get.width*0.8,
                      height: Get.height*0.25,
                      child: Image.asset(Paths.locations)),
                  SizedBox(height: Get.height*0.02),
                  CustomButton(title: "Nuevo viaje",
                    backgroundColor: Globals.principalColor,
                    onPressed: ()=>controller.onNewRegister()),
                  SizedBox(height: Get.height*0.02),
                  CustomButton(title: "Siguiente",
                      backgroundColor: Colors.black,
                      onPressed: ()=>controller.onFinishPage())
    ]).paddingAll(20)));
  }


}