import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconButton extends StatelessWidget{

  final void Function()? onPressed;
  final IconData icon;
  ///[iconWidget]this property replace the property icon.
  ///So the property's how [color],[size] is useless
  final Widget? iconWidget;
  final Color? color;
  final double? size;
  final Color? backgroundColor;

  const CustomIconButton({super.key, this.onPressed, this.icon=Icons.arrow_back,this.color, this.backgroundColor, this.iconWidget, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width*0.11,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30.0),
          border:  Border(
            top: BorderSide(width: 2.0, color: color??Colors.black),
            left: BorderSide(width: 2.0, color: color??Colors.black),
            right: BorderSide(width: 2.0, color: color??Colors.black),
            bottom: BorderSide(width: 4.0, color: color??Colors.black))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: IconButton(
            style: ElevatedButton.styleFrom(backgroundColor: color, padding: const EdgeInsets.symmetric(horizontal: 5.0),),
            onPressed: onPressed,
            icon: iconWidget??Icon(icon,size: size, color: backgroundColor==Colors.black?Colors.white:color??Colors.black)))
    );
  }
}