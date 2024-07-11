import 'package:flutter/material.dart';

class CustomImageAssets extends StatelessWidget {
  const CustomImageAssets({
    super.key,
    required this.url,
    this.height=double.infinity,
    this.width=double.infinity,
    this.fit=BoxFit.cover
  });

  final String url;
  final double width;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image(
      height: height,
      width: width,
      alignment: Alignment.center,
      filterQuality: FilterQuality.high,
      image: AssetImage(url),
      fit: fit,
    );
  }
}
