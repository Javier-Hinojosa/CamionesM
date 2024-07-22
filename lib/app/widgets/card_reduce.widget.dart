import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardReduce extends StatelessWidget{
  const CustomCardReduce({super.key,required this.child, this.backgroundColor});
  final Widget child;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(20.0),
        borderOnForeground: true,
        color: backgroundColor,
        child: SizedBox(
          width: Get.width,
          child: child
      ).paddingAll(10)
    );
  }


}