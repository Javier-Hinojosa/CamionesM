import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/nav/items/trips/register/trip_register_general.page.dart';
import 'package:camionesm/app/pages/nav/items/trips/trips.controller.dart';
import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register_general.page.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/chip.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripsPage extends GetView<TripsController>{
  const TripsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _floatingButton(),
        appBar: CustomAppBar(
            backgroundColor: Globals.principalColor,
            leadingColor: Theme.of(context).scaffoldBackgroundColor),
        body: SingleChildScrollView(
            child: Column(children: [
              const SimpleTitleCard(CustomNotification(child: CircleAvatar(backgroundColor:Colors.white, child: Icon(Icons.flag_outlined))), "Mis viajes"),
              SizedBox(height: Get.height*0.03),
              Visibility(visible: controller.isRegister(),
                  replacement: _listPage(context),
                  child: _registerPage())
            ]).paddingAll(15)));
  }

  Widget  _orderFilters() {
    return   Obx(()=>Wrap(
      spacing: 8.0, // Espacio horizontal entre chips
      runSpacing: 8.0, // Espacio vertical entre líneas de chips
      children: controller.trucksFilter.map((item) {
        return CustomChip.selector(
          isSelected: item.isSelect,
          paddingAll: 5,
          color: Colors.white,
          label: item.title,
          leading: const Icon(Icons.add, size: 18),
          onPressed: () {
            item.isSelect=!item.isSelect;
            controller.trucksFilter.refresh(); // Refresca la lista para actualizar el estado
          },
        );
      }).toList(),
    ));
  }
  Widget _listPage(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(alignment: Alignment.centerLeft, child: CustomText("Ordenar por", style: titleLarge.apply(fontSizeDelta: -4))),
          SizedBox(height: Get.height*0.02),
          _orderFilters(),
          SizedBox(height: Get.height*0.02),
          Align(alignment: Alignment.centerLeft, child: CustomText("Mis camiones", style: titleLarge.apply(fontSizeDelta: -4))),
          ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children:  const [

              ]),
          SizedBox(height: Get.height*0.02),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: Get.height*0.05,
                  width: Get.width*0.4,
                  child: CustomButton(
                      title: "Ver más",
                      backgroundColor: Colors.black,
                      onPressed: (){},
                      height: Get.height*0.05,
                      width: Get.width*0.4)))
        ]);
  }
  Widget _registerPage() {
    return Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: CustomText("¡Empezar registro!", style: titleLarge.apply(fontSizeDelta: -4))),
          SizedBox(height: Get.height*0.01),
          Align(alignment: Alignment.centerLeft, child: CustomText("Todavía no haz registrado un viaje. ¡Registra uno y empieza a ganar con cada kilómetro!",maxLines: 4, style: bodyMedium)),
          SizedBox(
              width: Get.width*0.8,
              height: Get.height*0.3,
              child: Image.asset(Paths.clipboardLocation)),
          SizedBox(height: Get.height*0.03),
          CustomButton(
              backgroundColor: Globals.principalColor,
              title: "Registrar",
              onPressed: ()=>Get.to(()=>const TripRegisterGeneralPage()))
        ]);
  }
  Widget _floatingButton() {
    return Visibility(
      visible: !controller.isRegister(),
      child: SizedBox(
          width: Get.width*0.15,
          height: Get.height*0.07,
          child: CustomIconButton(
              backgroundColor: Globals.principalColor,
              onPressed: ()=>Get.to(()=>const TrucksRegisterGeneralPage()),
              icon: Icons.add)),
    );
  }

}