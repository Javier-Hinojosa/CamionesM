import 'package:camionesm/app/pages/nav/Widgets/app_bar_home.widget.dart';
import 'package:camionesm/app/pages/nav/items/settings/settings.controller.dart';
import 'package:camionesm/app/widgets/cards/container.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/progess_bar.widget.dart';
import 'package:camionesm/app/widgets/switch_theme.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/data/models/internal/profile_item.module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController>{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Obx(() =>Visibility(
            visible: !controller.loading(),
            replacement: const CustomProgressBar(),
            child: Stack(
                children: [
                  Column(children: [
                        AppBarHome(
                            enableNotification: controller.enableNotification(),
                            lettersColor: Theme.of(context).scaffoldBackgroundColor,
                            name: "Jorge M."),
                        SizedBox(height: Get.height*0.6),
                        Align(alignment: Alignment.bottomLeft,child: _cardTheme(context)).paddingAll(15)
                      ]),
                  Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: ListView(children: SettingsController.profileItems.map((item)=> _cardItem(context,item)).toList()))
                ]))));
  }

 Widget  _cardItem(BuildContext context, ProfileItem item){
    return GestureDetector(
        onTap: ()=>controller.onSelectProfileItem(item.id),
        child: CustomContainer(
            backgroundColor: Theme.of(context).canvasColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    CustomNotification(haveNotification: item.haveNotification, child: CircleAvatar(backgroundColor: Theme.of(context).scaffoldBackgroundColor, child:  Icon(item.icon))),
                    SizedBox(width: Get.width*0.04),
                    CustomText(item.label)
                  ]),
                  Icon(Icons.arrow_forward_ios, color: Theme.of(context).cardColor.withOpacity(0.5))
                ])).paddingOnly(left: 15,right: 15,top: 10,bottom: 10)
    );
 }

 Widget _cardTheme(BuildContext context) {
    return CustomSwitch(
      value: controller.lightTheme(),
      onPressed: () => controller.onChangeMode()
    );
  }





}