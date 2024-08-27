import 'package:camionesm/app/pages/invoice/invoice.controller.dart';
import 'package:camionesm/app/pages/invoice/invoice_bank.page.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_put_archive.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InvoicePage extends GetView<InvoiceController> {
  const InvoicePage({super.key});

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
                    backgroundColor: Colors.black,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              child: CustomText("Datos de facturación",
                                textAlign: TextAlign.start,
                                style: titleLarge.apply(color: Colors.white))),
                          CustomImageAssets(
                              height: Get.height * 0.15,
                              width: Get.width * 0.3,
                              fit: BoxFit.fill,
                              url: Paths.invoiceChart)
                        ]).paddingAll(10)),
                SizedBox(height: Get.height*0.03),
                const CustomText("Emite la factura con los siguientes datos"),
                SizedBox(height: Get.height*0.02),
                ReactiveForm(
                    formGroup: controller.formInvoice(),
                    child: Column(
                  children: [
                    CustomReactiveTextField(Keys.rfc,
                        labelText: "RFC",
                        isActive: false,
                        hintText: "RFC"),
                    CustomReactiveTextField(Keys.name,
                        labelText: "Nombre",
                        isActive: false,
                        hintText: "Nombre"),
                    CustomReactiveTextField(Keys.cp,
                        labelText: "CP",
                        isActive: false,
                        hintText: "CP"),
                    CustomReactiveTextField(Keys.fiscalRegime,
                        labelText: "Régimen Fiscal",
                        isActive: false,
                        hintText: "Régimen Fiscal"),
                    CustomReactiveTextField(Keys.use,
                        labelText: "Uso",
                        isActive: false,
                        hintText: "Uso"),
                    CustomReactiveTextField(Keys.paymentMethod,
                        labelText: "Medio de pago",
                        isActive: false,
                        hintText: "Medio de pago")
                  ])),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText("Carga de pago"
                        ,maxLines: 2,
                        style:  TextStyle(fontWeight: FontWeight.w400)),
                    SizedBox(height: Get.height*0.02),
                    CustomContainerPutArchives(typeArchives: const [Archives.xml, Archives.pdf]),
                  ]).paddingAll(10),
                CustomButton(
                    title: "Siguiente",
                    backgroundColor: Colors.black,
                    onPressed: ()=>
                        Get.to(()=>const InvoiceBankPage())).paddingAll(10),
                SizedBox(height: Get.height*0.02)
              ]).paddingAll(20))));
  }

}
