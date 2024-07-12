import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, this.backgroundColor});

  final Color?  backgroundColor;

  @override
  Widget build(BuildContext context) {
   return AppBar(
     backgroundColor: backgroundColor,
     leading: IconButton(onPressed: ()=>Get.back(), icon:  const CustomIconButton()),
   );
  }

  @override
  Size get preferredSize => Size(Get.width, Get.height*0.2);



}