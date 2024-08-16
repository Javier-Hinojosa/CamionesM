import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:flutter/material.dart';

class CustomImageCircle extends CustomImageAssets {
  final Color? backgroundColor;
  final double? radius;
  final Color? borderColor;
  final double? borderWidth;
  const CustomImageCircle({this.backgroundColor,this.radius,this.borderColor, this.borderWidth, super.key,super.height, super.width,super.fit, super.hasOpacity, required super.url});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(borderWidth ?? 2.0), // Espaciado para el grosor del borde
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ?? Theme.of(context).disabledColor, // Color del borde
            width: borderWidth ?? 2.0)),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: radius,
        child: CustomImageAssets(url: url,
        height: height,
          width: width,
          fit: fit,
          hasOpacity: hasOpacity)));
  }

}