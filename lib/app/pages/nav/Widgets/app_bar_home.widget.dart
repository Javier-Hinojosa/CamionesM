import 'package:camionesm/app/widgets/app_bar/app_bar_undulated.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:camionesm/app/widgets/images/image_circle.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:camionesm/data/models/services/profile_user.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome(
      {super.key,
      required this.enableNotification,
      this.backgroundColor,
      this.lettersColor});

  final bool enableNotification;
  final Color? backgroundColor;
  final Color? lettersColor;

  @override
  Widget build(BuildContext context) {
    final ProfileUserService tempDataService = ProfileUserService();
    if(tempDataService.isLogged){
      return _customAppbar(context);
    }else{
      return _customAppbarRegister(context);
    }
  }

  Widget _customAppbar(BuildContext context) {
    return CustomAppBarUndulate(
        backgroundColor: backgroundColor,
        child: Row(children: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.profile),
            child: const Hero(
                tag: Keys.animationAppBarToProfile,
                child: CircleAvatar(
                    backgroundImage: AssetImage(Paths.profile1),
                    radius: 30.0))),
          SizedBox(width: Get.width * 0.05),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText("Bienvenido,",
                    style: labelLarge.apply(
                        color: lettersColor,
                        fontWeightDelta: FontWeight.w100.index)),
                CustomText("Jorge M.", style: titleLarge.apply(color: lettersColor))
              ]),
          SizedBox(width: Get.width * 0.2),
          SizedBox(
              height: Get.height * 0.05,
              child: CustomNotification(
                  haveNotification: enableNotification,
                  child: const CustomIconButton(
                      icon: Icons.notifications_none_outlined,
                      backgroundColor: Colors.black)))
        ]).paddingAll(15));
  }

  Widget _customAppbarRegister(BuildContext context) {
    return CustomAppBarUndulate(
        backgroundColor: backgroundColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: ()=>Get.toNamed(Routes.login),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(Icons.person,size: 26,color: Colors.black),
                    SizedBox(width: Get.width*0.02),
                    CustomText("Inicia sesión",
                        style: labelLarge.apply(
                            color: lettersColor,
                            decoration: TextDecoration.underline,
                            fontWeightDelta: FontWeight.w100.index))
                  ])),
            Row(
              children: [
                SizedBox(
                    width: Get.width*0.11,
                    height: Get.height * 0.05,
                    child: const CustomIconButton(
                        icon: Icons.notifications_none_outlined,
                        backgroundColor: Colors.black)),
                SizedBox(width: Get.width*0.02),
                _onMorePress()
              ])
            ]));
  }

  _onMorePress() {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        switch (result) {
          case '3':
            SystemNavigator.pop();
            break;
        }},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
     PopupMenuItem<String>(
    value: '3',
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.exit_to_app,color: Colors.black),
        SizedBox(width: Get.width*0.02),
        const Text('Salir')
      ]))],
        icon: SizedBox(
          width: Get.width*0.11,
          height: Get.height * 0.05,
          child: const CustomIconButton(
              backgroundColor: Colors.black,
              icon: Icons.more_horiz)));
  }


}
