import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget{
  const CustomContainer({super.key,required this.child, this.backgroundColor, this.circularRadius=20, this.width});
  final Widget child;
  final Color? backgroundColor;
  final double circularRadius;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(circularRadius),
        borderOnForeground: true,
        color: backgroundColor,
        child: SizedBox(
          width: width??Get.width,
          child: child
      ).paddingAll(10)
    );
  }
}
