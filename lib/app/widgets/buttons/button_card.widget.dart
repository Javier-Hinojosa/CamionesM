import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardButton extends StatelessWidget{
  final List<Widget> children;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double contentPadding;
  final Color? borderColor;
  final double radius;
  const CustomCardButton({super.key, required this.children, this.backgroundColor, this.onPressed, this.borderColor, this.radius=30, this.contentPadding=2.5});

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
          ).paddingAll(contentPadding)
        )
      )
    );
  }
}

class CustomCardButtonPrincipal extends CustomCardButton {
  const CustomCardButtonPrincipal({
    super.key,
    required super.children,
    super.backgroundColor,
    super.onPressed,
    super.borderColor,
    super.radius,
    super.contentPadding
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(radius),
      borderOnForeground: true,
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        splashColor: Colors.green, // Change splash color for this variant
        highlightColor: Colors.green, // Change highlight color for this variant
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(30.0),
              border:  Border(
                  top: BorderSide(width: 2.0, color: backgroundColor??Colors.black),
                  left: BorderSide(width: 2.0, color: backgroundColor??Colors.black),
                  right: BorderSide(width: 2.0, color: backgroundColor??Colors.black),
                  bottom: BorderSide(width: 4.0, color: backgroundColor??Colors.black))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children,
          ).paddingAll(contentPadding),
        ),
      ),
    );
  }
}

class CustomCardButtonExpanded extends CustomCardButton {
  final Widget title;
  final Widget? trailing;
  const CustomCardButtonExpanded({
    super.key,
    required super.children,
    super.backgroundColor,
    super.onPressed,
    super.borderColor,
    super.radius,
    super.contentPadding,
   required this.title,
    this.trailing
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(radius),
      borderOnForeground: true,
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        splashColor: Colors.green, // Change splash color for this variant
        highlightColor: Colors.green, // Change highlight color for this variant
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(radius),
              border:  Border.all(
                strokeAlign: BorderSide.strokeAlignInside,
                width: borderColor==Colors.black?2:1,
                color: borderColor??Colors.black45)),
          child: ExpansionTile(
            title: title,
            trailing: trailing,
            children: children,
          ).paddingAll(contentPadding),
        ),
      ),
    );
  }
}