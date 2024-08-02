import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, this.backgroundColor,this.onBack});

  final Color?  backgroundColor;
  final void Function()? onBack;

  @override
  Widget build(BuildContext context) {
   return AppBar(
     automaticallyImplyLeading: true,
       backgroundColor: Colors.transparent,
       elevation: 0,
     leadingWidth: Get.width*0.2,
     leading: IconButton(onPressed: onBack??()=>Get.back(), icon:  const CustomIconButton())
   );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height*0.065);


}