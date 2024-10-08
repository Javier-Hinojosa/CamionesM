import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, this.surfaceTintColor,this.onBack,this.trailing, this.backgroundColor, this.height});

  final Color?  surfaceTintColor;
  final Color? backgroundColor;
  final double? height;
  final List<Widget>? trailing;
  final void Function()? onBack;

  @override
  Widget build(BuildContext context) {
   return AppBar(
       surfaceTintColor: surfaceTintColor,
       automaticallyImplyLeading: true,
       backgroundColor: backgroundColor??Colors.transparent,
       elevation: 0,
       actions: trailing,
       leadingWidth: Get.width*0.135,
       leading: CustomIconButton(
           backgroundColor: Colors.white,
           onPressed: onBack??()=>Get.back()).paddingAll(5));
  }

  @override
  Size get preferredSize => Size.fromHeight(height??Get.height*0.065);


}