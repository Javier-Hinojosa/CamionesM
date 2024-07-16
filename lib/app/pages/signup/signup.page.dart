import 'package:camionesm/app/pages/signup/signup.controller.dart';
import 'package:camionesm/app/widgets/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button_card.widget.dart';
import 'package:camionesm/app/widgets/images_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpPage extends GetView<SingUpController> {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: ListView(shrinkWrap: true, children: [
           CustomText("¿Qué tipo de usuario eres?", style: Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: FontWeight.w100.index,fontSizeDelta: 4)).paddingOnly(bottom: 10,left: 10,right: 10),
          _textWithBold('Entendemos la importancia de conectar a los clientes con transportistas de manera eficiente. ', textBold: 'Por eso, te invitamos a identificarte según tu rol en nuestra red.').paddingAll(10),
          CustomCardButton(
              children:[
            Padding(
                padding: EdgeInsets.all(5),
                child: CustomImageAssets(url: "assets/images/box_icon.png",height: Get.height*0.15,width: Get.width*0.3,fit: BoxFit.fill,)),
            CustomText("1   Cliente ( Persona o empresa que envía)", style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: FontWeight.bold.value)),
            CustomText("Eres una persona o cliente que desea envíar.", style: Theme.of(context).textTheme.bodyMedium)
          ]).paddingAll(10),
          CustomCardButton(
              children:[
                Padding(
                    padding: EdgeInsets.all(5),
                    child: CustomImageAssets(url: "assets/images/charts_icon.png",height: Get.height*0.15,width: Get.width*0.3,fit: BoxFit.fill,)),
                CustomText("1   Cliente ( Persona o empresa que envía)", style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: FontWeight.bold.value)),
                CustomText("Eres una persona o cliente que desea envíar.", style: Theme.of(context).textTheme.bodyMedium)
              ]).paddingAll(10),
          CustomCardButton(
              children:[
                Padding(
                    padding: EdgeInsets.all(5),
                    child: CustomImageAssets(url: "assets/images/shop_icon.png",height: Get.height*0.15,width: Get.width*0.3,fit: BoxFit.fill,)),
                CustomText("1   Cliente ( Persona o empresa que envía)", style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: FontWeight.bold.value)),
                CustomText("Eres una persona o cliente que desea envíar.", style: Theme.of(context).textTheme.bodyMedium)
              ]).paddingAll(10)
        ]).paddingAll(15));
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
