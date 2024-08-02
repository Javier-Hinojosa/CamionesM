import 'package:camionesm/app/pages/detail/detail.controller.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/images/images_carrousel.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Column(
          children: [
            ImagesCarrousel(images: controller.imgList,index: controller.indexCarrousel,carouselController: controller.controllerCarrousel()),
            Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText("Acerca del cliente",textAlign: TextAlign.left,  style: Theme.of(context).textTheme.titleLarge?.apply(fontSizeDelta: -5))),
                SizedBox(height: Get.height*0.02),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(Paths.profile2)),
                      SizedBox(width: Get.width*0.03),
                      SizedBox(
                          width: Get.width*0.4,
                          height: Get.height*0.05,
                          child:  CustomButton(title: "Carlos Fuentes",color: Globals.secondColor, width: Get.width*0.4, height: Get.height*0.05, onPressed: (){}))
                    ]),
                Row(
                  children: [
                    const CustomText("Cliente verificado"),
                    SizedBox(width: Get.width*0.01),
                    const Icon(Icons.check_circle_outline,color: Colors.lightGreen,)
                  ]),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText("ID CL03459",style: TextStyle(color: Colors.black38))),
                Row(children: List.filled(5,  Icon(Icons.star, color: Colors.yellow[700]!,size:  30))),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText("450 Envíos realizados",style: TextStyle(fontWeight: FontWeight.w400))),
                Divider(thickness: 2)

              ]
            ).paddingAll(10)
          ])));
  }

}
