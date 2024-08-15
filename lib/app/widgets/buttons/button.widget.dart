import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget{

  final void Function()? onPressed;
  final void Function()? onLongPressed;
  final String title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({super.key, this.onPressed,this.onLongPressed, this.title="",this.backgroundColor,this.textColor, this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: const Border(
          top: BorderSide(width: 2.0, color: Colors.black),
          left: BorderSide(width: 2.0, color: Colors.black),
          right: BorderSide(width: 2.0, color: Colors.black),
          bottom: BorderSide(width: 4.0, color: Colors.black)
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: width==null?const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0):null),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: Container(
            alignment: Alignment.center,
            width: width??Get.width,
              height: height,
            child: Text(title, style: TextStyle(color: _validateTextColor(),fontWeight: FontWeight.w600))
          )
        )
      )
    );
  }

Color  _validateTextColor(){
 if(onPressed==null){
   return Colors.black45;
 } else if(textColor!=null) {
   return textColor!;
 } else{
   switch(backgroundColor){
     case Colors.black:return Colors.white;
     case Colors.white:return Colors.black;
     case Globals.errorColor:return Colors.white;
     default: return Colors.black;
   }}
  }
}

