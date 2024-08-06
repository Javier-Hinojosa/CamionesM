import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget{
  const AppBarProfile({super.key,this.backgroundColor,this.lettersColor});

  final Color? backgroundColor;
  final Color? lettersColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ]
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height*0.065);

}