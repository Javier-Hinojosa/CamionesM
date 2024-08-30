import 'package:camionesm/app/widgets/containers/container_outline.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainerExpandable extends CustomContainerOutline {
  final Widget title;
  final Widget? trailing;
  final EdgeInsetsGeometry? tilePadding;
  CustomContainerExpandable({
    super.key,
    required super.children,
    super.backgroundColor,
    super.radius,
    super.contentPadding,
    required this.title,
    this.trailing,
    this.tilePadding
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(radius),
        borderOnForeground: true,
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: Container(
            decoration: border,
            child: ExpansionTile(
              clipBehavior: Clip.none,
              minTileHeight: Get.height*0.04,
              tilePadding: tilePadding??EdgeInsets.zero,
              title: title,
              trailing: trailing,
              children: children,
            ).paddingAll(contentPadding)));
  }
}