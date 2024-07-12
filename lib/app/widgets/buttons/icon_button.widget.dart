import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget{

  final void Function()? onPressed;
  final IconData icon;
  final Color? color;

  const CustomIconButton({super.key, this.onPressed, this.icon=Icons.arrow_back,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: const Border(
          top: BorderSide(width: 2.0, color: Colors.black),
          left: BorderSide(width: 2.0, color: Colors.black),
          right: BorderSide(width: 2.0, color: Colors.black),
          bottom: BorderSide(width: 4.0, color: Colors.black),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: IconButton(
          style: ElevatedButton.styleFrom(backgroundColor: color, padding: const EdgeInsets.symmetric(horizontal: 5.0),),
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.black),
        ),
      ),
    );
  }
}