import 'package:flutter/material.dart';

 class CustomText extends StatelessWidget{

  final String title;
  final TextStyle? style;
  final int maxLines;
  final TextAlign? textAlign;

  const CustomText(this.title,{super.key,
    this.style,
    this.maxLines=2,
  this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: true,
        overflow: TextOverflow.ellipsis);
  }

}