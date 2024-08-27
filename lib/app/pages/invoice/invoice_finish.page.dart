import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceFinishPage extends StatelessWidget {
  const InvoiceFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  CustomAppBar(
            onBack: ()=>Get.close(5),
            backgroundColor: Theme.of(context).disabledColor.withOpacity(0.8)),
        body: Scrollbar(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                          backgroundColor: Theme.of(context).disabledColor.withOpacity(0.0),
                          child: CustomText("¡Tus datos fueron capturados exitosamente!",
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: titleLarge).paddingAll(10)),
                      SizedBox(height: Get.height*0.03),
                      const CustomText("Tu pago se realizará el día viernes próximo a la fecha de la recepción de tu factura y datos bancarios"),
                      SizedBox(height: Get.height*0.02),
                      CustomButton(title: "Siguiente",backgroundColor: Colors.black, onPressed: ()=>Get.close(5)).paddingAll(10),
                      SizedBox(height: Get.height*0.02)
                    ]).paddingAll(20))));
  }

}