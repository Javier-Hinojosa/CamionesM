import 'package:camionesm/app/pages/signup/registers/residence_fiscal/residence_fiscal.Controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/cards/card_reduce.widget.dart';
import 'package:camionesm/app/widgets/images_assets.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_dropdown_field.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ResidenceFiscalPage extends GetView<ResidenceFiscalController>{
  const ResidenceFiscalPage({super.key});

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body:   Obx(()=>
            ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                _customCardReduce(context,Paths.location,"Domicilio Fiscal"),
                ReactiveForm(
                    formGroup: controller.form(),
                    child: Column(children: [
                      CustomReactiveDropDown(Keys.state,
                          labelText: "Estado",
                          hintText: "Elige tu estado",
                          items: controller.states.map((e) => DropdownMenuItem(
                        value: e,
                        onTap: () => controller.onChangeState(e),
                        child: Text(e))).toList()),
                      CustomReactiveDropDown(Keys.municipal,
                          labelText: "Municipio o Delegación",
                          hintText: "Elige tu localidad",
                          items: controller.municipalsSelect.map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e))).toList()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex:6,
                            child: CustomReactiveTextField(Keys.street,
                                labelText: "Calle",
                                hintText: "Ingresa tu calle",
                                keyboard: TextInputType.emailAddress),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomReactiveTextField(Keys.streetNoExt,
                                labelText: "No.exterior",
                                hintText: "No.exterior",
                                keyboard: TextInputType.number)
                          )
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex:6,
                            child: CustomReactiveTextField(Keys.postalCode,
                                labelText: "Código postal",
                                hintText: "Ingresa tu código postal",
                                keyboard: TextInputType.number),
                          ),
                          Expanded(
                            flex: 4,
                            child: CustomReactiveTextField(Keys.streetNoInt,
                                labelText: "No.interior",
                                hintText: "No.interior",
                                keyboard: TextInputType.number),
                          )
                        ]
                      ),
                      SizedBox(
                        height: Get.height*.05,
                      )
                    ])),
                CustomButton(title: "Siguiente",
                    onPressed: controller.isValid()?()=>controller.onFinish():null,
                    color: Colors.black).paddingAll(10)
              ]
          ).paddingAll(15),
        )
    );
  }


  _customCardReduce(BuildContext context,String pathIcon, String title){
    const disableColor= Colors.transparent;
    return CustomCardReduce(
        backgroundColor: disableColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: Get.width*0.03),
              CustomImageAssets(url:pathIcon, height: Get.height*0.055,width: Get.width*0.12,fit: BoxFit.fill),
              SizedBox(width: Get.width*0.035),
              CustomText(title,maxLines: 1, style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: FontWeight.bold.value))
            ]
        )).paddingOnly(top: 10,bottom: 10);
  }


}