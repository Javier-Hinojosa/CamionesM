import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class CustomTimeLine extends StatelessWidget {
  final List<BuildTimelineTile> items;
  final Color? color;
  final Color? iconsColor;

   const CustomTimeLine({super.key, required this.items,this.color=Globals.principalColor, this.iconsColor});

  @override
  Widget build(BuildContext context) {
    return Timeline(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      theme: TimelineThemeData(
          color: color, connectorTheme:  ConnectorThemeData(space: 3,color: color)),
        children: items.map((e) => TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: e.paddingAll(15),
          node:  TimelineNode(
              endConnector:  items.last==e?null:SolidLineConnector(color: e.isActive?color:Colors.grey[400]),
              startConnector: items.first==e?null:SolidLineConnector(color: e.isActive?color:Colors.grey[400]),
              indicator: DotIndicator(
                size: 24,
                  color: e.isActive?color:Colors.grey[400],
                  child: e.isActive? Icon(Icons.check,color: iconsColor??Colors.black,size: 18):const Icon(Icons.tab,color: Colors.transparent,size: 18))
          ))).toList());
  }

}

class BuildTimelineTile extends StatelessWidget {
  final bool isActive;
  final IconData? leadingIcon;
  final String text;
  final String? subtitle;
  final Widget? trailing;

   const BuildTimelineTile({super.key,
     this.isActive = false,
     this.leadingIcon,
     this.subtitle,
     this.trailing,
     required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(leadingIcon!=null)
        Column(
          children: [
            _buildTimelineIcon(isActive: isActive, icon: leadingIcon!),
            const SizedBox(width: 10)
          ]),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                maxLines: 1,
               // overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  color: isActive ? Colors.black : Colors.black54)),
              if(subtitle!=null)
                CustomText(
                    subtitle!,
                    maxLines: 10,
                    style: bodyLarge.apply(
                      fontSizeDelta: -2,
                        color: Theme.of(context).disabledColor))
            ])),
        if(trailing!=null)
        Expanded(child: Align(
            alignment: Alignment.centerRight,
            child: trailing!))
      ]);
  }

  Widget _buildTimelineIcon({required bool isActive, required IconData icon}) {
    return SizedBox(
      height: Get.height*0.05,
      width: Get.width*0.1,
      child: CustomIconButton(
        backgroundColor: isActive ? Globals.principalColor : Colors.grey[100],
          icon: icon,
          color: isActive ? Colors.black : Colors.grey,
          size: 24));
  }
}
