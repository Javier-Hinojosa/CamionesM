import 'package:camionesm/app/widgets/app_bar/app_bar_undulated.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
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