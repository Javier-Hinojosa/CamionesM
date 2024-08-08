import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageAssets extends StatelessWidget {
  const CustomImageAssets({
    super.key,
    required this.url,
    this.height=double.infinity,
    this.width=double.infinity,
    this.fit=BoxFit.cover,
    this.hasOpacity=false
  });

  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final bool hasOpacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: hasOpacity?0.5:1,
      child: Image(
        height: height,
        width: width,
        alignment: Alignment.center,
        filterQuality: FilterQuality.high,
        colorBlendMode:BlendMode.darken ,
        image: AssetImage(url),
        fit: fit,
      ),
    );
  }
}
