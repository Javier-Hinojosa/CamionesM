import 'package:camionesm/app/pages/signup/signup.controller.dart';
import 'package:camionesm/app/pages/signup/signup2.page.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/button_card.widget.dart';
import 'package:camionesm/app/widgets/images/images_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpPage extends GetView<SingUpController> {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar:  const CustomAppBar(),
        body: Obx(()=> ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
             CustomText("¿Qué tipo de usuario eres?", style: Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: FontWeight.w100.index,fontSizeDelta: 4)).paddingOnly(bottom: 10,left: 10,right: 10),
            _textWithBold('Entendemos la importancia de conectar a los clientes con transportistas de manera eficiente. ', textBold: 'Por eso, te invitamos a identificarte según tu rol en nuestra red.').paddingAll(10),
            CustomCardButton(
                backgroundColor:controller.signUpModel.typeUser()==TypeUser.client?Globals.principalColor:null,
                onPressed: ()=>controller.signUpModel.typeUser(TypeUser.client),
                children:[
              Padding(
                  padding: const EdgeInsets.all(3),
                  child: CustomImageAssets(url: Paths.boxIcon,height: Get.height*0.12,width: Get.width*0.25,fit: BoxFit.fill)),
              CustomText("1   Cliente (Persona o empresa que envía)", style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: FontWeight.bold.value)),
              CustomText("Eres una persona o cliente que desea envíar.", style: Theme.of(context).textTheme.bodyMedium)
            ]).paddingAll(10),
            CustomCardButton(
                backgroundColor:controller.signUpModel.typeUser()==TypeUser.independentCarrier?Globals.principalColor:null,
                onPressed: ()=>controller.signUpModel.typeUser(TypeUser.independentCarrier),
                children:[
                  Padding(
                      padding: const EdgeInsets.all(3),
                      child: CustomImageAssets(url: Paths.chartsIcon,height: Get.height*0.12,width: Get.width*0.25,fit: BoxFit.fill)),
                  CustomText("2   Transportista Independiente", style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: FontWeight.bold.value)),
                  CustomText("Empresa de pequeña escala.", style: Theme.of(context).textTheme.bodyMedium)
                ]).paddingAll(10),
            CustomCardButton(
                backgroundColor:controller.signUpModel.typeUser()==TypeUser.businessCarrier?Globals.principalColor:null,
                onPressed: ()=>controller.signUpModel.typeUser(TypeUser.businessCarrier),
                children:[
                  Padding(
                      padding: const EdgeInsets.all(3),
                      child: CustomImageAssets(url: Paths.shopIcon,height: Get.height*0.12,width: Get.width*0.25,fit: BoxFit.fill)),
                  CustomText("3   Transportista Empresarial", style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: FontWeight.bold.value)),
                  CustomText("Empresa de mediana a grande escala.", style: Theme.of(context).textTheme.bodyMedium)
                ]).paddingAll(10),
             CustomButton(title: "Siguiente",
                 onPressed: controller.signUpModel.typeUser()==TypeUser.none?null:()=>Get.to(()=>const SingUp2Page()),
                 color: Colors.black).paddingAll(10)
          ]).paddingAll(10),
        ));
  }

 Widget _textWithBold(String normalText,{String? textBold, String? endNormalText}){
    return  RichText(
        text: TextSpan(text: normalText,
            style: Theme.of(Get.context!).textTheme.bodyMedium,
            children:  <TextSpan>[
               TextSpan(
                  text: textBold,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: endNormalText??"")
            ]));
  }
}
