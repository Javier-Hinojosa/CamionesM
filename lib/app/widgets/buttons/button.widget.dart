import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget{

  final void Function()? onPressed;
  final String title;
  final double? height;
  final double? width;
  final Color? color;

  const CustomButton({super.key, this.onPressed, this.title="",this.color, this.height,this.width});

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
              backgroundColor: color,
              padding: width==null?const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0):null),
          onPressed: onPressed,
          child: Container(
            alignment: Alignment.center,
            width: width??Get.width,
              height: height,
            child: Text(title, style: TextStyle(color: onPressed==null?Colors.black45:color==Colors.black?Colors.white:Colors.black,fontWeight: FontWeight.w600))
          )
        )
      )
    );
  }
}

