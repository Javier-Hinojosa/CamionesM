import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget{

  final Widget child;
  final Color? backgroundColor;
  final double circularRadius;
  final double? width;
  late final BorderRadiusGeometry _borderRadius;

  CustomContainer({super.key,required this.child, this.backgroundColor, this.circularRadius=20, this.width}){
    _borderRadius=BorderRadius.circular(circularRadius);
  }

  CustomContainer.circularTop({required this.child, this.backgroundColor, this.circularRadius=10, this.width, super.key}){
    _borderRadius=BorderRadius.only(topLeft: Radius.circular(circularRadius),topRight: Radius.circular(circularRadius));
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 1,
        borderRadius: _borderRadius,
        borderOnForeground: true,
        color: backgroundColor,
        child: SizedBox(
          width: width??Get.width,
          child: child).paddingAll(10));
  }
}
