import 'package:camionesm/core/values/globals.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainerOutline extends StatelessWidget{
  final List<Widget> children;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double contentPadding;
  final Color? borderColor;
  final double radius;
  final double borderWidth;
  final CrossAxisAlignment? crossAxisAlignment;
  late final Decoration? border;
  late final Widget? _borderDotted;

   CustomContainerOutline({super.key, required this.children, this.backgroundColor,this.borderWidth=2, this.onPressed, this.borderColor, this.radius=30, this.contentPadding=2.5, this.crossAxisAlignment}){
    border= BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border:  Border.all(
          strokeAlign: BorderSide.strokeAlignOutside,
          width: borderWidth,
          color: borderColor??Colors.black45,
        ));
    _borderDotted=null;
  }

  CustomContainerOutline.principal({required this.children, this.onPressed, this.backgroundColor, this.contentPadding=2.5,this.borderWidth=2, this.borderColor, this.radius=30,this.crossAxisAlignment, super.key}){
     border=BoxDecoration(
         color: backgroundColor,
         borderRadius: BorderRadius.circular(30.0),
         border:  Border(
             top: BorderSide(width: borderWidth, color: borderColor??Colors.black),
             left: BorderSide(width: borderWidth, color: borderColor??Colors.black),
             right: BorderSide(width: borderWidth, color: borderColor??Colors.black),
             bottom: BorderSide(width: borderWidth*2, color: borderColor??Colors.black)));
     _borderDotted=null;
  }

  CustomContainerOutline.dotted({required this.children, this.onPressed,this.borderWidth=2, this.backgroundColor, this.contentPadding=2.5, this.borderColor, this.radius=30,this.crossAxisAlignment, super.key}){
    border= null;

    _borderDotted=DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(radius),
      dashPattern: const [8, 4],
      color: borderColor??Colors.black,
      strokeWidth: borderWidth,
      child: Container(
          child: Column(
              crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment. center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: children).paddingAll(contentPadding)));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(radius),
      borderOnForeground: true,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      color: backgroundColor??Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        splashColor: Globals.principalColor,
        highlightColor: Globals.principalColor,
        onTap: onPressed,
        child: _borderDotted??Container(
          decoration: border,
            child: Column(
                crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment. center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: children).paddingAll(contentPadding))));
  }
}
