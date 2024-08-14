import 'package:camionesm/core/themes/material_state_property.theme.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget{

  final String label;
  final Color? color;
  final Widget? leading;
  final double paddingAll;
  final void Function()? onPressed;
  late final Widget _child;

   CustomChip({super.key, required this.label, this.color, this.paddingAll=15, this.leading, this.onPressed}){
     _child=Chip(
       avatar: leading,
       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
       visualDensity: VisualDensity.compact,
       padding: EdgeInsets.all(paddingAll),
       backgroundColor: color,
       label: Text(label),
       labelStyle: TextStyle(color:color==Colors.white?Colors.black:null));
   }

  CustomChip.selector({super.key, required this.label,
    required bool isSelected,
    this.color,
    Color? colorDisable,
    this.leading, this.paddingAll=15, this.onPressed}){
    _child = Chip(
      avatar: !isSelected?leading:null,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,
      color: buttonColor,
      surfaceTintColor: !isSelected?color:(colorDisable??Colors.black),
      deleteIconColor: !isSelected?color:(colorDisable??Colors.black),
      shadowColor: !isSelected?color:(colorDisable??Colors.black),
      padding: EdgeInsets.all(paddingAll),
      backgroundColor: !isSelected?color:(colorDisable??Colors.black),
      label: Text(label),
      elevation: 2,
      labelStyle: TextStyle(color:color==Colors.white?Colors.black:null));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: _child);
  }

}