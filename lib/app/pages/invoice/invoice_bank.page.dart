import 'package:camionesm/app/pages/invoice/invoice.controller.dart';
import 'package:camionesm/app/pages/invoice/invoice_finish.page.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';


class InvoiceBankPage extends GetView<InvoiceController> {
  const InvoiceBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  CustomAppBar(backgroundColor: Theme.of(context).disabledColor.withOpacity(0.8)),
        body: Scrollbar(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainer(
                        backgroundColor: Globals.principalColor,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: CustomText("Datos de facturación",
                                      textAlign: TextAlign.start,
                                      style: titleLarge)),
                              CustomImageAssets(
                                  height: Get.height * 0.15,
                                  width: Get.width * 0.3,
                                  fit: BoxFit.fill,
                                  url: Paths.chartBills)
                            ]).paddingAll(10)),
                    SizedBox(height: Get.height*0.03),
                    const CustomText("Con estos datos nos ayudas con la generación de tu pago"),
                    SizedBox(height: Get.height*0.02),
                    ReactiveForm(
                        formGroup: controller.formBank(),
                        child: Column(
                            children: [
                              CustomReactiveTextField(Keys.bank,
                                  labelText: "Nombre de Banco",
                                  isActive: false,
                                  hintText: "Nombre de Banco"),
                              CustomReactiveTextField(Keys.beneficiary,
                                  labelText: "Nombre de beneficiario",
                                  isActive: false,
                                  hintText: "Nombre de beneficiario"),
                              CustomReactiveTextField(Keys.noAccount,
                                  labelText: "No. cuenta",
                                  isActive: false,
                                  hintText: "No. cuenta"),
                              CustomReactiveTextField(Keys.interbankCode,
                                  labelText: "CLABE interbancaria",
                                  isActive: false,
                                  hintText: "CLABE interbancaria")
                            ])),
                    CustomButton(
                        title: "Siguiente",
                        backgroundColor: Colors.black,
                        onPressed: ()=>Get.to(()=>const InvoiceFinishPage())).paddingAll(10),
                    SizedBox(height: Get.height*0.02)
                  ]).paddingAll(20))));
  }
//Paths.invoiceChart

}