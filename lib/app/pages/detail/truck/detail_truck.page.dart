import 'package:camionesm/app/pages/detail/truck/detail_truck.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_expandable.widget.dart';
import 'package:camionesm/app/widgets/dividers/dotted_divider.widget.dart';
import 'package:camionesm/app/widgets/images/image_carrousel.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DetailTruckPage extends GetView<DetailTruckController> {
  const DetailTruckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(leadingColor: Colors.white),
        body: Obx(() => CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Column(
                  children: [
                    ImagesCarrousel(
                      images: controller.imgList,
                      valueIndex: controller.indexCarrousel(),
                      onPageChanged: (p0, p1) => controller.indexCarrousel(p0),
                      carouselController: controller.controllerCarrousel()),
                    SizedBox(height: Get.height*0.04)
                  ]),
                Positioned(
                  bottom: 0,
                  width: Get.width,
                  child: CustomContainer.circularTop(
                    backgroundColor: Colors.black,
                    child: const CustomText("ID TR01284",
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
                              child: CustomText("Detalles del transporte",
                                  textAlign: TextAlign.left,
                                  style: titleLarge.apply(fontSizeDelta: -10))),
                          SizedBox(
                              width: Get.width*0.1,
                              height: Get.height*0.045,
                              child:  CustomIconButton(
                                  icon: Icons.edit,
                                  onPressed: ()=>controller.isEditedTransport(!controller.isEditedTransport()),
                                  backgroundColor: controller.isEditedTransport()?Globals.secondColor:Globals.principalColor))
                        ]),
                    SizedBox(height: Get.height * 0.02),
                    ReactiveForm(
                      formGroup: controller.formRegisterTruck(),
                      child: Column(
                        children: [
                          _validateEditDataTruck(context,key: Keys.typeTruck, title: "Tipo de camión"),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: _validateEditDataTruck(context,key: Keys.brand, title: "Marca")),
                              const SizedBox(width: 20),
                              Expanded(child: _validateEditDataTruck(context,key: Keys.year, title: "Año"))
                            ]),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: _validateEditDataTruck(context,key: Keys.fuel, title: "Combustible")),
                              const SizedBox(width: 20),
                              Expanded(child: _validateEditDataTruck(context,key: Keys.truckPlate, title: "Placa camión"))
                            ]),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: _validateEditDataTruck(context,key: Keys.trailerPlate, title: "Placa remolque no.1")),
                              const SizedBox(width: 20),
                              Expanded(child: _validateEditDataTruck(context,key: Keys.trailerPlate2, title: "Placa remolque no.2"))
                            ]),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: _validateEditDataTruck(context,key: Keys.sct, title: "No. Perm SCT")),
                              const SizedBox(width: 20),
                              Expanded(child: _validateEditDataTruck(context,key: Keys.responsibleInsurer, title: "AseguradoraResp"))
                            ]),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                              children: [
                                Visibility(
                                    visible: controller.isEditedTransport(),
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
                        ])
                    ),
                    SizedBox(height: Get.height * 0.02),
                    const DottedDivider(dashSpace: 1),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText("Tipo de carga",
                                textAlign: TextAlign.left,
                                style: titleLarge.apply(fontSizeDelta: -10)),
                            CustomText("Cargas aceptadas para este transporte",
                                textAlign: TextAlign.left,
                                style: titleMedium.apply(
                                  fontSizeDelta: -2,
                                    color: Colors.black.withOpacity(0.5)))
                          ]),
                        SizedBox(
                            width: Get.width*0.1,
                            height: Get.height*0.045,
                            child:  CustomIconButton(
                                icon: Icons.edit,
                                onPressed: ()=>controller.isEditedProducts(!controller.isEditedProducts()),
                                backgroundColor: controller.isEditedProducts()?Globals.secondColor:Globals.principalColor))
                      ]),
                    SizedBox(height: Get.height * 0.02),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.checks.length,
                        primary: false,
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 40),
                        itemBuilder: (context, index) =>
                            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              Checkbox(value: controller.checks[index].isSelect, onChanged: (value) =>controller.onCheckChange(index,value)),
                              Expanded(child: CustomText(controller.checks[index].title, maxLines: 1, style: titleMedium))
                            ])),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      children: [
                        Visibility(
                            visible: controller.isEditedProducts(),
                            child: SizedBox(
                          height: Get.height*0.04,
                          width: Get.width*0.4,
                          child: CustomButton(
                            title: "Guardar",
                            height: Get.height*0.04,
                            width: Get.width*0.4,
                            onPressed: ()=>controller.onSaveProducts(),
                            backgroundColor: Colors.black)))
                      ]),
                    SizedBox(height: Get.height * 0.02),
                    const DottedDivider(dashSpace: 1),
                    SizedBox(height: Get.height * 0.02),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Documentos Adjuntos",
                            textAlign: TextAlign.left,
                            style: titleLarge.apply(fontSizeDelta: -10))),
                    SizedBox(height: Get.height * 0.03),
                    CustomContainerExpandable(contentPadding: 10, title: CustomText("Documentos",style: titleMedium,),children: const []),
                    SizedBox(height: Get.height * 0.02),
                    CustomContainerExpandable(contentPadding: 10, title: CustomText("Poliza de seguro",style: titleMedium,),children: const []),
                    SizedBox(height: Get.height * 0.02),
                    CustomContainerExpandable(contentPadding: 10, title: CustomText("Fotos del camión",style: titleMedium,),children: const [])
                  ])))
        ])));
  }

  //region widgets
  Widget _validateEditDataTruck(BuildContext context,{required String key,required String title}){
   var content=controller.formRegisterTruck().control(key).value??"";
    return Visibility(
     visible: controller.isEditedTransport(),
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
  //endregion

}
