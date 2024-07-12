import 'package:camionesm/app/pages/signup/signup.controller.dart';
import 'package:camionesm/app/widgets/app_bar.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpPage extends GetView<SingUpController> {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Align(
          alignment: Alignment.topCenter,
          child: ListView(shrinkWrap: true, children: [
             CustomText("¿Qué tipo de usuario eres?", style: Theme.of(context).textTheme.bodyLarge),
            _textWithBold('Entendemos la importancia de conectar a los clientes con transportistas de manera eficiente. ',
            textBold: 'Por eso, te invitamos a identificarte según tu rol en nuestra red.')
          ]).paddingAll(10),
        ));
  }

 Widget _textWithBold(String normalText,{String? textBold, String? endNormalText}){
    return  RichText(
        text: TextSpan(text: normalText,
            style: Theme.of(Get.context!).textTheme.bodyMedium,
            children:  <TextSpan>[
               TextSpan(
                  text: textBold,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: endNormalText??"")
            ]));
  }
}
