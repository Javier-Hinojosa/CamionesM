import 'package:camionesm/app/pages/invoice/invoice.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoicePage extends GetView<InvoiceController> {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  CustomAppBar(
            leadingColor: Colors.white,
            backgroundColor: Theme.of(context).disabledColor.withOpacity(0.8)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainer(
                  backgroundColor: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(child: CustomText("Datos de facturación", style: titleLarge.apply(color: Colors.white),textAlign: TextAlign.start)),
                  CustomImageAssets(
                      height: Get.height * 0.15,
                      width: Get.width * 0.3,
                      fit: BoxFit.fill,
                      url: Paths.invoiceChart)
                ]).paddingAll(10)),
              SizedBox(height: Get.height*0.02),
              const CustomText("Emite la factura con los siguientes datos"),

            ]).paddingAll(20)
        ));
  }
  //Paths.invoiceChart

}
