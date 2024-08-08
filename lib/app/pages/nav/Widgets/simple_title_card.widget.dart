import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/cards/container.widget.dart';
import 'package:camionesm/app/widgets/images/images_assets.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleTitleCard<T> extends StatelessWidget {
  const SimpleTitleCard(this.icon, this.title, {super.key});

  final T icon;
  final String title;

  static const _disableColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        backgroundColor: _disableColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: Get.width * 0.03),
              _genericWidget(icon),
              SizedBox(width: Get.width * 0.035),
              CustomText(title,
                  maxLines: 1,
                  style:
                      bodyMedium.apply(fontWeightDelta: FontWeight.bold.value))
            ])).paddingOnly(top: 10, bottom: 10);
  }

  Widget _genericWidget(T type) {
    if (type is String) {
      return CustomImageAssets(
          url: type,
          height: Get.height * 0.055,
          width: Get.width * 0.12,
          fit: BoxFit.fill);
    } else if (type is Widget) {
      return type;
    } else if (type is IconData) {
      return CircleAvatar(backgroundColor: Colors.white, child: Icon(type));
    } else {
      throw Exception("Object not Implemented");
    }
  }
}
