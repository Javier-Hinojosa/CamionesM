import 'package:camionesm/app/pages/nav/items/truks/register/trucks_register.controller.dart';
import 'package:camionesm/app/pages/nav/items/truks/widgets/step_progress.widget.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/containers/container.widget.dart';
import 'package:camionesm/app/widgets/containers/container_expandable.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/images/images_assets.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_calendar.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

 class TrucksRegisterPhotoPage extends GetView<TrucksRegisterController>{
  const TrucksRegisterPhotoPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leadingColor: Theme.of(context).scaffoldBackgroundColor,backgroundColor: Globals.principalColor),
      bottomSheet: _customBottom(context),
      body: SingleChildScrollView(
        child: Column(children: [
          Align(alignment: Alignment.centerLeft, child: CustomText("¡Ya en el último paso!", style: titleLarge.apply(fontSizeDelta: -4))),
          Align(alignment: Alignment.centerLeft, child: _textWithBold("No te mortifiques, posteriormente en la sección de ",textBold: "“Mis vehículos”",endNormalText: " podrás editar o agregar nueva información si lo deseas.",)),
          SizedBox(height: Get.height*0.02),
          ReactiveForm(
            formGroup: controller.formRegisterPhoto1(),
            child: CustomContainerExpandable(
              backgroundColor: controller.isValidRegisterPhotoForm1()?Colors.grey[300]:null,
                contentPadding: 10,
                title: _customTitleExpandable("Tarjeta de circulación", controller.isValidRegisterPhotoForm1()),
                children: [
                  SizedBox(height: Get.height*0.02),
                  _containerPhoto("Tarjeta de circulación frontal",onTap: () =>  controller.pickImage()),
                  SizedBox(height: Get.height*0.02),
                  _containerPhoto("Tarjeta de circulación trasero",onTap: () =>  controller.pickImage()),
                  SizedBox(height: Get.height*0.02),
                  CustomReactiveTextField(Keys.dueDate,
                    isActive: false,
                    onTap: (p0) => _calendarDialog(context,"Selecciona tu fecha de vencimiento de Tarjeta de circulación",controller.formRegisterPhoto1()),
                    labelText: "Fecha de vencimiento de Tarjeta de circulación",
                    hintText: "DD/MM/AA")
            ])),
          SizedBox(height: Get.height*0.02),
          ReactiveForm(
              formGroup: controller.formRegisterPhoto2(),
              child: CustomContainerExpandable(
                  backgroundColor: controller.isValidRegisterPhotoForm2()?Colors.grey[300]:null,
                  contentPadding: 10,
                  title: _customTitleExpandable("Poliza de seguro", controller.isValidRegisterPhotoForm2()),
                  children: [
                    SizedBox(height: Get.height*0.02),
                    _containerPhoto("Poliza de seguro",onTap: () =>  controller.pickImage()),
                    SizedBox(height: Get.height*0.02),
                    CustomReactiveTextField(Keys.dueDate,
                        isActive: false,
                        onTap: (p0) => _calendarDialog(context,"Selecciona la fecha de vencimiento de la Poliza de seguro",controller.formRegisterPhoto2()),
                        labelText: "Fecha de vencimiento",
                        hintText: "DD/MM/AA")
                  ])),
          SizedBox(height: Get.height*0.02),
          ReactiveForm(
              formGroup: controller.formRegisterPhoto3(),
              child: CustomContainerExpandable(
                  backgroundColor: controller.isValidRegisterPhotoForm3()?Colors.grey[300]:null,
                  contentPadding: 10,
                  title: _customTitleExpandable("Fotos de camión", controller.isValidRegisterPhotoForm3()),
                  children: [
                    SizedBox(height: Get.height*0.02),
                    Align(alignment: Alignment.centerLeft, child: CustomText("Recuerda que mientras mejores fotos mejores posibilidades de posicionamiento en la plataforma", style: bodyMedium)),
                    SizedBox(height: Get.height*0.02),
                    _containerPhoto("Fotos de tu camión",onTap: () =>  controller.pickImage()),
                    SizedBox(height: Get.height*0.02),
                  ])),
          SizedBox(height: Get.height*0.2)
        ]).paddingAll(20))
    );
  }

  Widget _textWithBold(String normalText,{String? textBold, String? endNormalText}) {
    return RichText(
        text:
        TextSpan(text: normalText, style: bodyMedium, children: <TextSpan>[
          TextSpan(
              text: textBold, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: endNormalText ?? "")
        ]));
  }
  Widget _customBottom(BuildContext context) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(20),
        height: Get.height*0.2,
        child: ListView(
            shrinkWrap: true,
            children: [
              const CustomProgressStepTruck(isActive: [false,false,true]),
              SizedBox(height: Get.height*0.02),
              Obx(()=> SizedBox(
                  height: Get.height*0.06,
                  width: Get.width*0.2,
                  child: CustomButton(
                      title: "Terminar registro",
                      height: Get.height * 0.02,
                      width: Get.width * 0.4,
                      color: Globals.principalColor,
                      onLongPressed: ()=>onDialogError(context),
                      onPressed: controller.isValidRegisterPhotoForm1() && controller.isValidRegisterPhotoForm2() //&& controller.isValidRegisterPhotoForm3()
                          ? ()=>controller.onFinishRegister()
                          : null)))
            ]));
  }
  Widget _containerPhoto(String title,{void Function()? onTap}){
    return CustomContainer(
        child: Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: CustomText(title, style: titleLarge.apply(fontSizeDelta: -12))),
          SizedBox(height: Get.height*0.02),
          Align(alignment: Alignment.centerLeft, child: CustomText("Cargar Archivo", style: bodyMedium)),
          SizedBox(height: Get.height*0.01),
          Align(alignment: Alignment.centerLeft, child: CustomText("Sólo archivos .jpg, .png o pdf con menos de 100kb", style: bodyMedium.apply(color: Colors.black))),
          SizedBox(height: Get.height*0.01),
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
                width: Get.width*0.8,
                height: Get.height*0.15,
                child: CustomContainerOutline.dotted(
                    contentPadding: 10,
                    backgroundColor: Globals.principalColor.withAlpha(50),
                    children: [
                      Center(
                          child: SizedBox(
                              width: Get.width*0.35,
                              height: Get.height*0.08,
                              child: CustomContainerOutline(
                                  radius: 10,
                                  backgroundColor: Globals.principalColor,
                                  children: const [Icon(Icons.add_a_photo_outlined,color: Colors.black,size: 30)])))
                    ])))
        ]));
  }
  Widget _customTitleExpandable(String title,bool isCheck){
    return Visibility(
        visible: isCheck,
        replacement: CustomText(title, style: titleLarge.apply(fontSizeDelta: -8)),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(title, style: titleLarge.apply(fontSizeDelta: -8)),
          CustomImageAssets(url: Paths.circleCheck,fit: BoxFit.fill, width: Get.width*0.08,height: Get.height*0.04)
        ]));
  }

  Future<bool> _calendarDialog(BuildContext context,String subtitle, FormGroup form) {
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText("Calendario", style: titleLarge)),
          CustomText(subtitle,
              textAlign: TextAlign.start,
              style: bodyMedium.apply(color: Theme.of(context).disabledColor)),
          ReactiveForm(
              formGroup: form,
              child: const CustomReactiveCalendar(Keys.dueDate)),
          Container(padding: const EdgeInsets.all(10)),
          Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                  height: Get.height * 0.05,
                  width: Get.width * 0.4,
                  child: CustomButton(
                      title: "Aceptar",
                      height: Get.height * 0.02,
                      width: Get.width * 0.4,
                      color: Colors.black,
                      onPressed: () => Get.back(result: true))))
        ]));
  }

 Future<bool> onDialogError(BuildContext context) {
   return DialogUtils.dialog(
       child: ListView(shrinkWrap: true, children: [
         CircleAvatar(
             radius: 40,
             backgroundColor: Colors.red.withOpacity(0.1),
             child: const Icon(Icons.warning_amber_outlined,color: Colors.redAccent,size: 40)),
         SizedBox(height: Get.height*0.02),
         Align(
             alignment: Alignment.center,
             child: CustomText("¡UPPS!", style: titleLarge)),
         Container(padding: const EdgeInsets.all(10)),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           CustomText("Tu documento", style: bodyMedium),
           CustomText("no fue aprobado/a", style: bodyMedium)
         ]),
         SizedBox(height: Get.height*0.02),
         CustomText("Observaciones", style: bodyMedium.apply(fontWeightDelta: FontWeight.bold.value)),
         SizedBox(height: Get.height*0.02),
         CustomText("El documento no cumple con los requisitos", style: bodyMedium),
         SizedBox(height: Get.height*0.01),
         Row(
          children: [
            const Icon(Icons.error,color: Colors.red,size: 18),
            SizedBox(width: Get.width*0.02),
            Expanded(child: CustomText("Por favor, inténta nuevamente subir el/los documentos requeridos faltantes o comunícate con el equipo de soporte.",
                style: bodyMedium.apply(color: Colors.redAccent) ,maxLines: 4))
          ]),
         SizedBox(height: Get.height*0.02),
         CustomButton(title: "Intenta nuevamente",color: Colors.black,onPressed: (){
           Get.back();
           onDialogError2();}),
         SizedBox(height: Get.height*0.01),
         Align(alignment: Alignment.centerRight,
             child: CustomText("Ver detalles", style: bodyMedium.apply(fontWeightDelta: FontWeight.w600.value))),
         SizedBox(height: Get.height*0.06)
       ]));
 }

  onDialogError2() {
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
          CircleAvatar(
              radius: 40,
              backgroundColor: Colors.red.withOpacity(0.1),
              child: const Icon(Icons.warning_amber_outlined,color: Colors.redAccent,size: 40)),
          SizedBox(height: Get.height*0.02),
          Align(
              alignment: Alignment.center,
              child: CustomText("¡UPPS!", style: titleLarge)),
          Container(padding: const EdgeInsets.all(10)),
          CustomText("Lamentamos informarte que los documentos que has subido no han sido aprobados.",style: bodyMedium.apply(color: Colors.black)),
          SizedBox(height: Get.height*0.02),
          Row(
              children: [
                const Icon(Icons.error,color: Colors.red,size: 18),
                SizedBox(width: Get.width*0.02),
                Expanded(child: CustomText("Por favor, revisa los requisitos y asegúrate de que todos los documentos sean legibles. Si necesitas ayuda, consulta con nuestro soporte.",
                    style: bodyMedium.apply(color: Colors.redAccent) ,maxLines: 5))
              ]),
          SizedBox(height: Get.height*0.06),
          CustomButton(title: "Contactanos",color: Colors.white,onPressed: ()=>controller.openWhatsApp()),
          SizedBox(height: Get.height*0.01),
          CustomButton(title: "Regresar",color: Colors.black,onPressed: ()=>Get.back()),
          SizedBox(height: Get.height*0.03)
        ]));
  }


 }