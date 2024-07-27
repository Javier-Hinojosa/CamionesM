import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardButton extends StatelessWidget{
  final List<Widget> children;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final double radius;
  const CustomCardButton({super.key, required this.children, this.backgroundColor, this.onPressed, this.borderColor, this.radius=30});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(radius),
      borderOnForeground: true,
      color: backgroundColor??Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        splashColor: Globals.principalColor,
        highlightColor: Globals.principalColor,
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(radius),
                border:  Border.all(
                  strokeAlign: BorderSide.strokeAlignInside,
                 width: borderColor==Colors.black?2:1,
                 color: borderColor??Colors.black45,
                )
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children,
          ).paddingAll(2.5)
        ),
      ),
    );
  }



}