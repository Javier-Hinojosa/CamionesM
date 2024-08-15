import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/signup/registers/general_data/general_data.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GeneralDataPage extends GetView<GeneralDataController>{
  const GeneralDataPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       extendBodyBehindAppBar: true,
       appBar: const CustomAppBar(),
       body:   ListView(
       shrinkWrap: true,
       physics: const BouncingScrollPhysics(),
       children: [
         const SimpleTitleCard(Paths.personPlus,"Datos generales"),
       ReactiveForm(
             formGroup: controller.form(),
             child: Column(children: [
               CustomReactiveTextField(Keys.reasonSocial,
                   labelText: "Razón social",
                   hintText: "Ingresa el nombre de tu empresa",
                   keyboard: TextInputType.text),
           Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 const Text("Telefóno",style: TextStyle(fontWeight: FontWeight.w400)),
               IntlPhoneField(
                 decoration: outLineText(context,hintText: "Introduce tu número celular"),
                 initialCountryCode: 'MX',
                 invalidNumberMessage: "Número Telefónico Invalido",
                 onChanged: (phone) =>controller.onPhoneComplete(phone.completeNumber)
               ).paddingOnly(top: 10)]).paddingAll(10),
               CustomReactiveTextField(Keys.email,
                   labelText: "Correo Electrónico",
                   hintText: "Ingresa tu correo electrónico",
                   keyboard: TextInputType.emailAddress),
               CustomReactiveTextField(Keys.emailConfirm,
                   labelText: "Confirmación de correo Electrónico",
                   hintText: "Confirma tu correo electrónico",
                   keyboard: TextInputType.emailAddress),
               CustomReactiveTextField(Keys.rfcGD,
                   labelText: "RFC",
                   hintText: "RFC",
                   keyboard: TextInputType.text),

             ])),
       Obx(()=>CustomButton(title: "Siguiente",
               onPressed: controller.isValid()?()=>controller.onFinish():null,
               backgroundColor: Colors.black).paddingAll(10))
       ]
     ).paddingAll(15)
    );
  }





}