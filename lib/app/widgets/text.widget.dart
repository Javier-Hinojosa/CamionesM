import 'package:flutter/material.dart';

 class CustomText extends StatelessWidget{

  final String title;
  final TextStyle? style;
  final int maxLines;

  const CustomText(this.title,{super.key,
    this.style,
    this.maxLines=2});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: style,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis);
  }

}