import 'package:camionesm/core/themes/material_state_property.theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChip extends StatelessWidget{

  final String label;
  final Color? labelColor;
  final Color? backgroundColor;
  final Widget? leading;
  final double paddingAll;
  final double borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final void Function()? onPressed;
  late final Widget _child;

   CustomChip({super.key, required this.label,this.labelColor,this.borderRadius=30,this.borderColor,this.borderWidth, this.backgroundColor, this.paddingAll=7, this.leading, this.onPressed}){
     _child=Container(
       padding: EdgeInsets.all(paddingAll),
       decoration: BoxDecoration(
         color: backgroundColor??Theme.of(Get.context!).scaffoldBackgroundColor.withOpacity(0.2),
         borderRadius: BorderRadius.circular(borderRadius),
         border: Border.all(color: borderColor??Colors.black, width:borderWidth??1.0)),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,
         children: [
           if (leading != null) ...[
             leading!,
             const SizedBox(width: 8)
           ],
           Text(
             label,
             style: TextStyle(color:backgroundColor==Colors.white?Colors.black:labelColor))
         ]));
   }

  CustomChip.selector({super.key, required this.label,
    required bool isSelected,
    this.borderRadius=30,
    this.borderColor,
    this.backgroundColor,
    this.labelColor,
    this.borderWidth,
    Color? colorDisable,
    this.leading, this.paddingAll=15, this.onPressed}){
    _child = Chip(
      avatar: !isSelected?leading:null,
      side: BorderSide(color: borderColor??const Color(0xFF000000),width: borderWidth??1.0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,
      color: CustomWidgetStateProperty.buttonColor(),
      surfaceTintColor: !isSelected?backgroundColor:(colorDisable??Colors.black),
      deleteIconColor: !isSelected?backgroundColor:(colorDisable??Colors.black),
      shadowColor: !isSelected?backgroundColor:(colorDisable??Colors.black),
      padding: EdgeInsets.all(paddingAll),
      backgroundColor: !isSelected?backgroundColor:(colorDisable??Colors.black),
      label: Text(label),
      elevation: 2,
      labelStyle: TextStyle(color:backgroundColor==Colors.white?Colors.black:labelColor));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: _child);
  }

}