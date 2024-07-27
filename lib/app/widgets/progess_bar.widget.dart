import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';


class CustomProgressBar extends StatelessWidget {
  final double size;
  final String? text;

  const CustomProgressBar({Key? key, this.size = 100, this.text}) : super(key: key);

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
