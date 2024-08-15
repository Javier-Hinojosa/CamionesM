import 'package:camionesm/app/pages/nav/Widgets/simple_title_card.widget.dart';
import 'package:camionesm/app/pages/signup/registers/access_data/access_data.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AccessDataPage extends GetView<AccessDataController>{
  const AccessDataPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       extendBodyBehindAppBar: true,
       appBar: const CustomAppBar(),
       body:   ListView(
       shrinkWrap: true,
       physics: const BouncingScrollPhysics(),
       children: [
         const SimpleTitleCard(Paths.key,"Datos de Acceso"),
       ReactiveForm(
             formGroup: controller.form(),
             child: Column(children: [
               CustomReactiveTextField(Keys.user,
                   labelText: "Crea tu usuario",
                   hintText: "Ingresa tu nombre o correo electrónico",
                   keyboard: TextInputType.text),
               CustomReactiveTextField(Keys.pass,
                   labelText: "Crea tu contraseña",
                   hintText: "Crea tu contraseña",
                   keyboard: TextInputType.text),
               CustomReactiveTextField(Keys.passConfirm,
                   labelText: "Confirma tu contraseña",
                   hintText: "Confirma tu contraseña",
                   keyboard: TextInputType.text),
               SizedBox(height: Get.height*.05)
             ])),
       Obx(()=>CustomButton(title: "Siguiente",
               onPressed: controller.isValid()?()=>controller.onFinish():null,
               backgroundColor: Colors.black).paddingAll(10))
       ]).paddingAll(15));
  }





}