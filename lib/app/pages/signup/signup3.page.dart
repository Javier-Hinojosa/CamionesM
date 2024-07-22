import 'package:camionesm/app/pages/signup/signup.controller.dart';
import 'package:camionesm/app/widgets/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/button_card.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/card_reduce.widget.dart';
import 'package:camionesm/app/widgets/images_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SingUp3Page extends GetView<SingUpController> {
   const SingUp3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          CustomText("Empecemos con tu registro.", style: Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: FontWeight.w100.index,fontSizeDelta: 4)).paddingOnly(bottom: 10,left: 10,right: 10),
          _genericWidget(context,Paths.personPlus,"Datos generales","Completa tus datos para acceder a oportunidades de carga eficiente.",WidgetStatus.closed),
          _genericWidget(context,Paths.location,"Domicilio Fiscal","Ingresa tu domicilio fiscal para procesar transacciones de carga.",WidgetStatus.enabled),
          _genericWidget(context,Paths.briefcase,"Datos de Representante Legal","Proporciona información del representante legal para fines legales.",WidgetStatus.enabled),
          _genericWidget(context,Paths.key,"Datos de Acceso","Crea tus credenciales de acceso para gestionar envíos y servicios.",WidgetStatus.enabled),
          CustomButton(title: "Guardar y salir", onPressed:()=>Get.toNamed(Routes.splashScreen)).paddingAll(10),
          CustomButton(title: "Siguiente", onPressed:(){}, color: Colors.black).paddingAll(10)
        ]
      ).paddingAll(15)
    );
  }

  _genericWidget(BuildContext context,String pathIcon, String title, String subtitle,WidgetStatus status){
    switch(status){
      case WidgetStatus.enabled: return _customCard(context,pathIcon, title,subtitle, false);
      case WidgetStatus.disabled: return _customCard(context,pathIcon, title,subtitle, true);
      case WidgetStatus.closed: return _customCardReduce(context,pathIcon, title,subtitle);
    }
  }

   _customCard(BuildContext context,String pathIcon, String title, String subtitle, bool disable){
   final disableColor= Theme.of(context).disabledColor;
    return  CustomCardButton(
        borderColor: disable?null:Colors.black,
        children: [
          ListTile(
              leading: CustomImageAssets(url:pathIcon,hasOpacity: disable, height: Get.height*0.055,width: Get.width*0.12,fit: BoxFit.fill),
              title:  CustomText(title, style: Theme.of(context).textTheme.bodyMedium!.apply(color: disable?disableColor:null,fontWeightDelta: FontWeight.bold.value)),
              subtitle:   Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: Get.height*0.01),
                    CustomText(subtitle, style: Theme.of(context).textTheme.bodyMedium!.apply(color: disable?disableColor:null), textAlign: TextAlign.start),
                    Visibility(
                        visible: !disable,
                        child: SizedBox(height: Get.height*0.01)),
                    Visibility(
                        visible: !disable,
                        child: CustomButton(color: Globals.principalColor, title: "Agregar",width: Get.width*0.3,height: Get.height*0.05,onPressed: ()=>controller.onDynamicPage(pathIcon)))
                  ]
              )
          )
        ]).paddingOnly(top: 10,bottom: 10);
   }

   _customCardReduce(BuildContext context,String pathIcon, String title, String subtitle){
    return CustomCardReduce(
      backgroundColor: Globals.principalColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: Get.width*0.03),
        CustomImageAssets(url:pathIcon, height: Get.height*0.055,width: Get.width*0.12,fit: BoxFit.fill),
          SizedBox(width: Get.width*0.035),
          CustomText(title,maxLines: 1, style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: FontWeight.bold.value)),
          SizedBox(width: Get.width*0.14),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: Get.height*0.05, child: CustomIconButton(onPressed: ()=>controller.onDynamicPage(pathIcon), icon: Icons.edit)),
              SizedBox(width: Get.width*0.035),
              SizedBox(height: Get.height*0.05, child: const CustomIconButton(icon: Icons.check,color: Colors.lightGreen,backgroundColor: Colors.white))
            ])
        ]
      )).paddingOnly(top: 10,bottom: 10);
  }

}