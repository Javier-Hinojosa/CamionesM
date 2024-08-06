import 'package:flutter/material.dart';
import 'package:get/get.dart';

///[CustomAppBarUndulate] This widget should not be used in the AppBar section
///can use: Scaffold(body:) or Material(child:) or SafeArea(child:)
class CustomAppBarUndulate extends StatelessWidget implements PreferredSizeWidget {
   const CustomAppBarUndulate({super.key, this.backgroundColor, this.child, this.pathBackgroundImage});
  final Color? backgroundColor;
  ///suggest use [Row] Widget to span the entire width of the screen
  final Widget? child;
  final String? pathBackgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.18,
      decoration: BoxDecoration(
        image: pathBackgroundImage!=null?DecorationImage(image: AssetImage(pathBackgroundImage!),fit: BoxFit.cover):null,
        color: backgroundColor??Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(70.0))),
      padding: const EdgeInsets.all(16.0),
      child: child);
  }
   @override
   Size get preferredSize => Size.fromHeight(Get.height*0.18);
}