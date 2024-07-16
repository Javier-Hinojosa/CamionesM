import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardButton extends StatelessWidget{
  final List<Widget> children;
  const CustomCardButton({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(30.0),
      borderOnForeground: true,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        splashColor: Globals.principalColor,
        highlightColor: Globals.principalColor,
        onTap: (){},
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30.0),
                border:  Border.all(
                  strokeAlign: BorderSide.strokeAlignInside,
                 color: Colors.black45,
                )
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children,
          ).paddingAll(10)
        ),
      ),
    );
  }



}