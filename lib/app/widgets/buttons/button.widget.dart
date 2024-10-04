import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget{

  final void Function()? onPressed;
  final void Function()? onLongPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;

  late final BoxBorder? _border;
  late final Color? _textColor;
  late final String? _title;
  late final Widget? _child;

   CustomButton({super.key, this.onPressed,this.onLongPressed,this.backgroundColor, this.height,this.width, String? title, Color? textColor}){
     _title=title;
     _textColor=textColor;
     _child=null;
     _border=const Border(
         top: BorderSide(width: 2.0, color: Colors.black),
         left: BorderSide(width: 2.0, color: Colors.black),
         right: BorderSide(width: 2.0, color: Colors.black),
         bottom: BorderSide(width: 4.0, color: Colors.black));
   }

   CustomButton.withoutBorder({super.key, this.onPressed,this.onLongPressed,this.backgroundColor, this.height,this.width,String? title, Color? textColor})
       :_border=null,_title=title,_textColor=textColor,_child=null;

   CustomButton.child({super.key, this.onPressed,this.onLongPressed,this.backgroundColor, this.height,this.width, Widget? child}){
     _child=child;
     _border=const Border(
        top: BorderSide(width: 2.0, color: Colors.black),
        left: BorderSide(width: 2.0, color: Colors.black),
        right: BorderSide(width: 2.0, color: Colors.black),
        bottom: BorderSide(width: 4.0, color: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: _border),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: width==null?const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0):null),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: _child??Container(
            alignment: Alignment.center,
            width: width??Get.width,
              height: height,
            child: Text(_title??"", style: TextStyle(color: validateTextColor(),fontWeight: FontWeight.w600))
          )
        )
      )
    );
  }

Color validateTextColor(){
 if(onPressed==null){
   return Colors.black45;
 } else if(_textColor!=null) {
   return _textColor;
 } else{
   switch(backgroundColor){
     case Colors.black:return Colors.white;
     case Colors.white:return Colors.black;
     case Globals.errorColor:return Colors.white;
     default: return Colors.black;
   }}
  }
}

