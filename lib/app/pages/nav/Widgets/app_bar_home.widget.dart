import 'package:camionesm/app/widgets/app_bar/app_bar_undulated.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/notification.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome(
      {super.key,
      required this.enableNotification,
      required this.name,
      this.backgroundColor,
      this.lettersColor});

  final String name;
  final bool enableNotification;
  final Color? backgroundColor;
  final Color? lettersColor;

  @override
  Widget build(BuildContext context) {
    return _customAppbar(context);
  }

  Widget _customAppbar(BuildContext context) {
    return Column(children: [
      CustomAppBarUndulate(
          backgroundColor: backgroundColor,
          child: Row(children: [
            GestureDetector(
              onTap: () => Get.toNamed(Routes.profile),
              child: const Hero(
                  tag: Keys.animationAppBarToProfile,
                  child: CircleAvatar(
                      backgroundImage: AssetImage(Paths.profile),
                      radius: 30.0)),
            ),
            SizedBox(width: Get.width * 0.05),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText("Bienvenido,",
                      style: labelLarge.apply(
                          color: lettersColor,
                          fontWeightDelta: FontWeight.w100.index)),
                  CustomText(name, style: titleLarge.apply(color: lettersColor))
                ]),
            SizedBox(width: Get.width * 0.2),
            SizedBox(
                height: Get.height * 0.05,
                child: CustomNotification(
                    haveNotification: enableNotification,
                    child: const CustomIconButton(
                        icon: Icons.notifications_none_outlined,
                        backgroundColor: Colors.black)))
          ]).paddingAll(15))
    ]);
  }
}
