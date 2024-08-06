import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class CustomTimeLine extends StatelessWidget {
  final List<BuildTimelineTile> items;

   const CustomTimeLine({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Timeline(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      theme: TimelineThemeData(color: Globals.principalColor, connectorTheme: const ConnectorThemeData(space: 3,color: Globals.principalColor)),
        children: items.map((e) => TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: e.paddingAll(15),
          node:  TimelineNode(
              endConnector:  items.last==e?null:SolidLineConnector(color: e.isActive?Globals.principalColor:Colors.grey[400]),
              startConnector: items.first==e?null:SolidLineConnector(color: e.isActive?Globals.principalColor:Colors.grey[400]),
              indicator: DotIndicator(
                  color: e.isActive?Globals.principalColor:Colors.grey[400],
                  child: e.isActive?const Icon(Icons.check,color: Colors.black):const Icon(Icons.tab,color: Colors.transparent))
          ))).toList());
  }

}

class BuildTimelineTile extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final String text;
  final Widget? trailing;

   const BuildTimelineTile(
      {super.key,
      this.isActive = false,
      required this.icon,
      required this.text, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTimelineIcon(isActive: isActive, icon: icon),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
           // overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
              color: isActive ? Colors.black : Colors.black54)),
        ),
        trailing!=null?
        Expanded(child: Align(
            alignment: Alignment.centerRight,
            child: trailing!)):Container()
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
          size: 24,
      ),
    );
  }
}
