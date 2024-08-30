import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget{

  final Widget child;
  final Color? backgroundColor;
  final double radius;
  final double contentPadding;
  final double? height;
  final double? width;
  final double elevation;
  late final BorderRadiusGeometry _borderRadius;

  CustomContainer({super.key,required this.child, this.backgroundColor, this.radius=20, this.width,this.elevation=1,this.contentPadding=10, this.height}){
    _borderRadius=BorderRadius.circular(radius);
  }

  CustomContainer.circularTop({required this.child, this.backgroundColor, this.radius=10,this.elevation=1,this.contentPadding=10, this.width,this.height, super.key}){
    _borderRadius=BorderRadius.only(topLeft: Radius.circular(radius),topRight: Radius.circular(radius));
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: elevation,
        borderRadius: _borderRadius,
        borderOnForeground: true,
        color: backgroundColor,
        child: SizedBox(
          width: width??Get.width,
          height: height,
          child: child).paddingAll(contentPadding));
  }
}
