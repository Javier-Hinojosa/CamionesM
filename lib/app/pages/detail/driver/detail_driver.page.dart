import 'package:camionesm/app/pages/detail/driver/detail_driver.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_expandable.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/images/image_circle.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DetailDriverPage extends GetView<DetailDriverController> {
  const DetailDriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(leadingColor: Colors.white),
        body: Obx(() => CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                _header(context),
                Positioned(
                  bottom: 0,
                  width: Get.width,
                  child: CustomContainer.circularTop(
                    backgroundColor: Colors.black,
                    child: const CustomText("ID CN010874",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)).paddingOnly(left: 10)))
              ])),
          SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText("Detalles del conductor",
                                  textAlign: TextAlign.left,
                                  style: titleLarge.apply(fontSizeDelta: -10))),
                          SizedBox(
                              width: Get.width*0.1,
                              height: Get.height*0.045,
                              child:  CustomIconButton(
                                  icon: Icons.edit,
                                  onPressed: ()=>controller.isEditedDriver(!controller.isEditedDriver()),
                                  backgroundColor: controller.isEditedDriver()?Globals.secondColor:Globals.principalColor))
                        ]),
                    SizedBox(height: Get.height * 0.02),
                    ReactiveForm(
                      formGroup: controller.formRegisterDriver(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _validateEditDataTruck(context,key: Keys.name, title: "Nombre"),
                          SizedBox(height: Get.height * 0.02),
                          _validateEditDataTruck(context,key: Keys.lastName, title: "Apellidos"),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _validateEditDataTruck(context,key: Keys.phone, title: "Teléfono")),
                              const SizedBox(width: 5),
                              Expanded(child: _validateEditDataTruck(context,key: Keys.rfc, title: "RFC"))
                            ]),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                              children: [
                                Visibility(
                                    visible: controller.isEditedDriver(),
                                    child: SizedBox(
                                        height: Get.height*0.04,
                                        width: Get.width*0.4,
                                        child: CustomButton(
                                            title: "Guardar",
                                            height: Get.height*0.04,
                                            width: Get.width*0.4,
                                            onPressed: ()=>controller.onSaveTransport(),
                                            backgroundColor: Colors.black)))
                              ])
                        ])),
                    SizedBox(height: Get.height * 0.02),
                    const DottedDivider(dashSpace: 1),
                    SizedBox(height: Get.height * 0.02),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Documentos",
                            textAlign: TextAlign.left,
                            style: titleLarge.apply(fontSizeDelta: -10))),
                    SizedBox(height: Get.height * 0.03),
                    CustomContainerExpandable(contentPadding: 10, title: CustomText("Identificación",style: titleMedium,),children: const []),
                    SizedBox(height: Get.height * 0.02),
                    CustomContainerExpandable(contentPadding: 10, title: CustomText("Licencia tipo B o C",style: titleMedium,),children: const []),
                  ])))
        ])));
  }

  //region widgets
  Widget _validateEditDataTruck(BuildContext context,{required String key,required String title}){
   var content=controller.formRegisterDriver().control(key).value??"";
    return Visibility(
     visible: controller.isEditedDriver(),
     replacement: _customColumn(context,title,content),
     child: CustomReactiveTextField(key,
     labelText: title, maxLines: 5)
    );
  }
  Widget _customColumn(BuildContext context, String title, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       CustomText(title,maxLines: 2, style: bodyMedium),
        SizedBox(height: Get.height*0.01),
        CustomText(content,maxLines: 5, style: bodyMedium.apply(color: Colors.black,fontWeightDelta: FontWeight.w300.index,fontSizeDelta: 2))
      ]);
  }
  Widget _header(BuildContext context) {
    return Column(
        children: [
          Container(
              color: Theme.of(context).disabledColor.withOpacity(0.7),
              width: Get.width,
              height: Get.height*0.25,
              child:  Center(
                  child: Stack(
                      children: [
                        const CustomImageCircle(
                            url: Paths.profile3,
                            radius: 65,
                            fit: BoxFit.fill),
                        Positioned(
                            right: 1,
                            bottom: 1,
                            child: Container(
                                padding: const EdgeInsets.all(2),
                                constraints: const BoxConstraints(
                                    minWidth: 12,
                                    minHeight: 12),
                                child: SizedBox(
                                    width: Get.width*0.1,
                                    height: Get.height*0.05,
                                    child:  CustomIconButton(
                                        onPressed: ()=>controller.pickImage(),
                                        icon: Icons.edit,backgroundColor: Globals.principalColor))))
                      ]))),
          SizedBox(height: Get.height*0.02)
        ]);
  }
  //endregion

}
