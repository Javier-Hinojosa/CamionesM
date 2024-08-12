import 'package:camionesm/app/pages/nav/items/truks/truck.controller.dart';
import 'package:camionesm/app/pages/nav/items/truks/widgets/step_progress.widget.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/button_card.widget.dart';
import 'package:camionesm/app/widgets/cards/container.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

 class TrucksRegisterPhotoPage extends GetView<TrucksController>{
  const TrucksRegisterPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leadingColor: Theme.of(context).scaffoldBackgroundColor,backgroundColor: Globals.principalColor),
      bottomSheet: _customBottom(context),
      body: SingleChildScrollView(
        child: Column(children: [
          Align(alignment: Alignment.centerLeft, child: CustomText("¡Ya en el último paso!", style: titleLarge.apply(fontSizeDelta: -4))),
          Align(alignment: Alignment.centerLeft, child: CustomText("No te mortifiques, posteriormente en la sección de “Mis vehículos” podrás editar o agregar nueva información si lo deseas.", style: bodyMedium)),
          SizedBox(height: Get.height*0.02),
          CustomCardButton(children: [],)
        ]).paddingAll(20))
    );
  }

  Widget _customBottom(BuildContext context) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(20),
        height: Get.height*0.2,
        child: ListView(
            shrinkWrap: true,
            children: [
              const CustomProgressStepTruck(isActive: [false,false,true]),
              SizedBox(height: Get.height*0.02),
              Obx(()=> SizedBox(
                  height: Get.height*0.06,
                  width: Get.width*0.2,
                  child: CustomButton(
                      title: "Siguiente",
                      height: Get.height * 0.02,
                      width: Get.width * 0.2,
                      color: Colors.black,
                      onPressed: controller.isValidRegisterSpecificForm()
                          ? () => Get.to(()=>const TrucksRegisterPhotoPage())
                          : null)),
              )
            ])
    );
  }


}