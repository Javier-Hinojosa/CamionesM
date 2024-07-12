import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

  final void Function()? onPressed;
  final String title;
  final Color? color;

  const CustomButton({super.key, this.onPressed, this.title="",this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), //
        border: const Border(
          top: BorderSide(width: 2.0, color: Colors.black),
          left: BorderSide(width: 2.0, color: Colors.black),
          right: BorderSide(width: 2.0, color: Colors.black),
          bottom: BorderSide(width: 4.0, color: Colors.black),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
           backgroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          ),
          onPressed: onPressed,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Text(title, style: TextStyle(color: color==Colors.black?Colors.white:Colors.black,fontWeight: FontWeight.w600))
          ),
        ),
      ),
    );
  }
}

