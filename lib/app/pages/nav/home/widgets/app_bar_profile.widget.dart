import 'package:camionesm/app/widgets/app_bar/app_bar_undulated.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarProfile extends StatelessWidget{
  const AppBarProfile({super.key,required this.enableNotification, required this.name});

  final String name;
  final bool enableNotification;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _customAppbar(context)]
    );
  }

 Widget _customAppbar(BuildContext context){
    return Column(
      children: [
        CustomAppBarUndulate(
            child:  Row(children: [
              const CircleAvatar(
                  backgroundImage: AssetImage(Paths.profile),
                  radius: 30.0),
              SizedBox(width: Get.width*0.05),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText("Bienvenido,",style: Theme.of(context).textTheme.labelLarge!.apply(fontWeightDelta: FontWeight.w100.index)),
                    CustomText(name,style: Theme.of(context).textTheme.titleLarge)
                  ]),
              SizedBox(width: Get.width*0.2),
              SizedBox(
                  height: Get.height*0.05,
                  child:  enableNotification? const CustomNotification(child:CustomIconButton(icon: Icons.notifications_none_outlined,backgroundColor: Colors.black)):
                  const CustomIconButton(icon: Icons.notifications_none_outlined,backgroundColor: Colors.black))
            ]).paddingAll(15)
        )
      ]
    );
  }

}