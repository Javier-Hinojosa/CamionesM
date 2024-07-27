import 'package:flutter/material.dart';

class CustomChips extends StatelessWidget{

  const CustomChips({super.key, required this.label, this.color, this.paddingAll=15, this.leading, this.onPressed});

  final String label;
  final Color? color;
  final Widget? leading;
  final double paddingAll;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: leading,
      onDeleted: onPressed,
      padding: EdgeInsets.all(paddingAll),
      backgroundColor: color,
      label: Text(label),
      labelStyle: TextStyle(color:color==Colors.white?Colors.black:null),
    );
  }

}