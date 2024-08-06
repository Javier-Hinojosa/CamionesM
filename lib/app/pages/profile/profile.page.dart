import 'package:camionesm/app/pages/profile/profile.controller.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar_undulated.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/button_card.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/app/widgets/time_line.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController>{
   ProfilePage({super.key});

   final TextStyle disableText =Theme.of(Get.context!).textTheme.bodyMedium!.apply(color: Theme.of(Get.context!).disabledColor);
   final TextStyle titleLarge = Theme.of(Get.context!).textTheme.titleLarge!;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    CustomAppBarUndulate(
                        pathBackgroundImage: Paths.splash,
                        child: Row(children: [
                          SizedBox(
                              width: Get.width*0.13,
                              child: CustomIconButton(backgroundColor: Colors.white,onPressed: ()=>Get.back()))
                        ]).paddingAll(15)),
                    SizedBox(height:  Get.height*0.07),
                    _contentBody(context)
                  ]),
                _customHead(context)
              ]),
          ],
        ),
      ));
  }

 Widget _contentBody(BuildContext context) {
    return  Column(
      children: [
        CustomText("Insignia de Plata", textAlign: TextAlign.center, maxLines: 4, style: disableText),
        SizedBox(height:  Get.height*0.01),
        CustomText("Jorge Murillo Sánchez",style: titleLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on_outlined,color: Colors.black),
              CustomText("México, CDMX",style: Theme.of(context).textTheme.bodyMedium!.apply(fontSizeDelta: 2))
            ]),
        SizedBox(height:  Get.height*0.02),
        Card(
          elevation: 0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _customColumnText(context,"78"," Viajes "),
              _customColumnText(context,"862","Kilómetros"),
              _customColumnText(context,"${"★"} 4.2","valoraciones")
            ]).paddingAll(15)
        ).paddingAll(22),
        Align(alignment: Alignment.centerLeft, child: CustomText("Progreso de perfil", style: titleLarge.apply(fontSizeDelta: -4))),
        SizedBox(height:  Get.height*0.02),
        _customCardProgressProfile(context),
        SizedBox(height:  Get.height*0.02),
        _customCardDataPersonal(context)
      ]).paddingAll(20);
  }

 Widget _customHead(BuildContext context) {
    return Center(
        heightFactor: 2.5,
        child: GestureDetector(
            onTap: ()=>Get.toNamed(Routes.profile),
            child:  const Hero(
                tag: Keys.animationAppBarToProfile,
                child: CircleAvatar(
                    backgroundImage: AssetImage(Paths.profile),
                    radius: 60.0))));
 }

 Widget _customColumnText(BuildContext context,String text, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
       CustomText(text,style: titleLarge),
        CustomText(title,style: disableText)
      ]);
  }

  Widget _customCardProgressProfile(BuildContext context) {
    return  CustomCardButtonPrincipal(
        children: [
          CustomTimeLine(items: [
            const BuildTimelineTile(
                icon: Icons.account_box,
                text: "Registro",
                isActive: true),
            BuildTimelineTile(
                icon: Icons.create_new_folder_rounded,
                text: "Documentos",trailing: CustomButton(
                width: Get.width*0.3,
                height: Get.height*0.05,
                title: "Agregar",color: Globals.principalColor,onPressed: (){})),
            BuildTimelineTile(
                icon: Icons.local_shipping,
                text: "Registro camiones",
                trailing: CustomButton(
                    width: Get.width*0.3,
                    height: Get.height*0.05,
                    title: "Agregar",color: Globals.principalColor,onPressed: (){})),
            BuildTimelineTile(
                icon: Icons.group,
                text: "Registro conductores",
                trailing: CustomButton(
                    width: Get.width*0.3,
                    height: Get.height*0.05,
                    title: "Agregar",color: Globals.principalColor,onPressed: (){}))
          ]).paddingAll(5)
        ]);
  }

 Widget _customCardDataPersonal(BuildContext context) {
    return CustomCardButtonExpanded(
      contentPadding: 10,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomText("Datos generales", style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
              height: Get.height*0.05,
              width: Get.width*0.12,
              child: const CustomIconButton(backgroundColor:  Globals.principalColor, icon: Icons.edit, size: 24))
        ]),
      children: [

        ]);
  }
}