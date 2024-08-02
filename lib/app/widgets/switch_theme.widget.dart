import 'package:camionesm/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomSwitch extends StatelessWidget{
  final bool value;
  final Function()? onPressed;

  const CustomSwitch({super.key, required this.value, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width*0.6,
        height: Get.height*0.05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: value ? Globals.backgroundColorBlack.withOpacity(1):Globals.backgroundColor.withOpacity(1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
               padding: const EdgeInsets.all(5),
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: Globals.backgroundColor.withOpacity(1)),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SizedBox(width: Get.width*0.04),
                       const Icon(Icons.sunny,color: Colors.black,size: 18),
                       SizedBox(width: Get.width*0.02),
                       const Text("Claro"),
                       SizedBox(width: Get.width*0.04)
                     ])),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: Globals.backgroundColorBlack.withOpacity(1)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: Get.width*0.04),
                        const Icon(Icons.dark_mode_outlined,size: 18),
                        SizedBox(width: Get.width*0.02),
                        const Text("Oscuro",style: TextStyle(color: Colors.white)),
                        SizedBox(width: Get.width*0.04)
                      ]))
            ])
    );
  }
}
