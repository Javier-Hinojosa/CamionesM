import 'package:flutter/material.dart';
import 'package:get/get.dart';

///[CustomAppBarUndulate] This widget should not be used in the AppBar section
///can use: Scaffold(body:) or Material(child:) or SafeArea(child:)
class CustomAppBarUndulate extends StatelessWidget{
   const CustomAppBarUndulate({super.key,
     this.backgroundColor,
     this.child});
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.18,
      decoration: BoxDecoration(
        color: backgroundColor??Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(70.0))),
      padding: const EdgeInsets.all(16.0),
      child: child,
    );
  }
}