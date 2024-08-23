import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomProgressBar extends StatelessWidget {
  final double size;
  final String? text;

  const CustomProgressBar({super.key, this.size = 100, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            text != null
                ? text!.isNotEmpty
                    ? Text(text!).paddingOnly(top: 50)
                    : Container()
                : Container()
          ],
        ));
  }
}
