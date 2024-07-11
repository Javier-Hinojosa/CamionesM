import 'package:flutter/material.dart';

class DecorationUtils {

  static BoxDecoration boxBlur(BuildContext context, {Color? color}) {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
      BoxShadow(
          color: color??Theme.of(context).scaffoldBackgroundColor.withOpacity(0.65),
        //  blurRadius: 5.5,
         // offset: const Offset(5, 5),
          spreadRadius: 3)
    ]);
  }
}