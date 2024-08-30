import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/nav/items/petitions/petitions.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/chip.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetitionsListPage extends GetView<PetitionsController>{
  const PetitionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  const CustomAppBar(backgroundColor: Globals.principalColor),
        body: Obx(
            ()=> Scrollbar(
              child: SingleChildScrollView(
                child: Column(children: [
                  const SimpleTitleCard(CircleAvatar(backgroundColor:Colors.white, child: Icon(Icons.mail_outline)), "Solicitudes"),
                  SizedBox(height: Get.height*0.03),
                  SizedBox(
                      height: Get.height*0.05,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: controller.typeListPetitions.map((e) =>
                              CustomChip(label: e.title,
                                  borderRadius: 15,
                                  leading: Icon(e.icon,color: e.isSelect?Colors.white: Colors.black),
                                  backgroundColor:  e.isSelect?Colors.black:null,
                                  labelColor: e.isSelect?Colors.white:null,
                                  borderWidth: 2,
                                  onPressed: ()=>controller.onChangeListType(e)).paddingOnly(right: 10)).toList())),
                  SizedBox(height: Get.height*0.03),
                  Align(alignment: Alignment.centerLeft, child: CustomText(controller.labelText(), style: titleLarge.apply(fontSizeDelta: -4))),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: controller.listDynamic.map((element) => element.paddingOnly(top: 10,bottom: 10)).toList()),
                  SizedBox(height: Get.height*0.02),
                  CustomButton(title: "Ver más",
                      backgroundColor: Colors.black,
                      width: Get.width*0.4,
                      onPressed: (){},
                      height: Get.height*0.05),
                  SizedBox(height: Get.height*0.02)
                ]).paddingAll(15)))));
  }

 Widget cardDriver(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(Paths.profile1)),
                SizedBox(width: Get.width * 0.03),
                SizedBox(
                    width: Get.width * 0.4,
                    height: Get.height * 0.05,
                    child: CustomContainer(
                        backgroundColor: Globals.principalColor,
                        width: Get.width * 0.4,
                        height: Get.height * 0.05,
                        child: const Center(child: CustomText("Carlos Fuentes",style: TextStyle(fontWeight: FontWeight.w600)))))
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.star_rate_rounded,
                    color: Colors.black, size: 24),
                SizedBox(width: Get.width * 0.01),
                CustomText("4.2",
                    style: titleMedium.apply(
                        fontWeightDelta: FontWeight.bold.value))
              ])
        ]);
  }

  Widget cardEarnings(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText("Ganancia",
              style: titleMedium.apply(
                  fontWeightDelta: FontWeight.w300.index)),
          CustomText("\$4,300 MXN",
              style: titleMedium.apply(
                  fontSizeDelta: 10,
                  fontWeightDelta: FontWeight.w300.index))
        ]);
 }

 Widget cardDirections(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText("Puebla a CDMX", style: titleMedium),
        SizedBox(height: Get.height * 0.015),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black12,
                child:
                Icon(Icons.calendar_month_outlined, color: Colors.black)),
            SizedBox(width: Get.width * 0.03),
            CustomText("Fecha de envío", style: titleMedium)
          ]),
          const CustomText("03/04/24")
        ]),
      ]);
 }

 Widget cardMoreDetails(){
    return const Align(
        alignment: Alignment.centerRight,
        child: CustomText("Ver detalles",
            style: TextStyle(fontWeight: FontWeight.w500)));
  }




}