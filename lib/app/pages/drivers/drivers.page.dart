import 'package:camionesm/app/pages/drivers/drivers.controller.dart';
import 'package:camionesm/app/pages/drivers/register/driver_register_general.page.dart';
import 'package:camionesm/app/pages/drivers/widgets/my_driver_card.widget.dart';
import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/chip.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriversPage extends GetView<DriversController> {
  const DriversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _floatingButton(),
        appBar:  CustomAppBar(
            backgroundColor: Globals.principalColor,
            leadingColor: Theme.of(context).scaffoldBackgroundColor),
        body:  SingleChildScrollView(
            child: Column(
              children: [
                const SimpleTitleCard(CustomNotification(child: CircleAvatar(backgroundColor:Colors.white, child: Icon(Icons.group_outlined))), "Mis Conductores"),
                SizedBox(height: Get.height*0.03),
                Visibility(visible: controller.isRegister(),
                    replacement: _listPage(context),
                    child: _registerPage())
              ]).paddingAll(15)));
  }

  Widget _registerPage() {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: CustomText("¡Empezar registro!", style: titleLarge.apply(fontSizeDelta: -4))),
        SizedBox(height: Get.height*0.01),
        Align(alignment: Alignment.centerLeft, child: CustomText("Maximiza tu eficiencia y gana más con cada kilómetro. ¡Empieza a registrar a el conductor/es de tus viajes!",maxLines: 4, style: bodyMedium)),
        SizedBox(
            width: Get.width*0.8,
            height: Get.height*0.3,
            child: Image.asset(Paths.clipboardPersons)),
        SizedBox(height: Get.height*0.03),
        CustomButton(
            backgroundColor: Globals.principalColor,
            title: "Registrar",
            onPressed: ()=>Get.to(()=>const DriverRegisterGeneralPage()))
      ]);
 }
  Widget _listPage(BuildContext context) {
    return  Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: CustomText("Ordenar por", style: titleLarge.apply(fontSizeDelta: -4))),
        SizedBox(height: Get.height*0.02),
        _orderFilters(),
        SizedBox(height: Get.height*0.02),
        Align(alignment: Alignment.centerLeft, child: CustomText("Mis conductores", style: titleLarge.apply(fontSizeDelta: -4))),
        ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children:  [
              MyDriverCard(onDelete: ()=>_onDialogDeleteItem(context),onDetail: ()=>Get.toNamed(Routes.detailDriver),onEdit: (){}),
              MyDriverCard(onDelete: ()=>_onDialogDeleteItem(context),onDetail: ()=>Get.toNamed(Routes.detailDriver),onEdit: (){}),
              MyDriverCard(onDelete: ()=>_onDialogDeleteItem(context),onDetail: ()=>Get.toNamed(Routes.detailDriver),onEdit: (){})
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
  Widget  _orderFilters() {
    return   Obx(()=>Wrap(
      spacing: 8.0, // Espacio horizontal entre chips
      runSpacing: 8.0, // Espacio vertical entre líneas de chips
      children: controller.trucksFilter.map((item) {
        return CustomChip.selector(
          isSelected: item.isSelect,
          paddingAll: 5,
          backgroundColor: Colors.white,
          label: item.title,
          leading: const Icon(Icons.add, size: 18),
          onPressed: () {
            item.isSelect=!item.isSelect;
            controller.trucksFilter.refresh(); // Refresca la lista para actualizar el estado
          });
      }).toList(),
    ));
  }
  Widget _floatingButton() {
    return Visibility(
      visible: !controller.isRegister(),
      child: SizedBox(
          width: Get.width*0.15,
          height: Get.height*0.07,
          child: CustomIconButton(
              backgroundColor: Globals.principalColor,
              onPressed: ()=>Get.to(()=>const DriverRegisterGeneralPage()),
              icon: Icons.add)),
    );
  }

  Future<bool> _onDialogDeleteItem(BuildContext context) {
    var errorColor=Theme.of(context).colorScheme.error;
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: errorColor, // Color del borde (rojo)
                        width: 3.0)),
                child: CircleAvatar(
                    radius: 50,
                    backgroundColor: errorColor.withOpacity(0.2),
                    child: Image.asset(Paths.trash).paddingAll(20)),
              )),
          SizedBox(height: Get.height*0.02),
          Align(
              alignment: Alignment.center,
              child: CustomText("¿Estás seguro?", style: titleLarge)),
          SizedBox(height: Get.height*0.02),
          Align(
              alignment: Alignment.center,
              child: CustomText("¿De verdad quieres eliminar este registro? Este proceso no se puede deshacer.",textAlign: TextAlign.center , style: bodyMedium,maxLines: 4).paddingOnly(right: 20,left: 20)),
          SizedBox(height: Get.height*0.1),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: Get.width*0.35,
                    child: CustomButton(title: "Cancelar",
                        backgroundColor: Theme.of(context).disabledColor.withOpacity(0.05),
                        onPressed: ()=>Get.back())),
                SizedBox(width: Get.width*0.01),
                SizedBox(
                    width: Get.width*0.35,
                    child: CustomButton(title: "Eliminar",
                        backgroundColor: errorColor,
                        onPressed: (){}))
              ]),
          SizedBox(height: Get.height*0.05),
        ]));
  }

}
