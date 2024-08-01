import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<bool> dialog({required Widget child, List<TextButton>? options}) async {
    try{
      return await Get.dialog(AlertDialog(
        title: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                onTap: () => Get.back(result: true),
                child: const Icon(Icons.close_outlined, color: Colors.black))),
        content: SizedBox(width: Get.width, child: child),
        actions: options));
    }catch(e){
      return true;
    }
  }

  static Future<bool> screen({required Widget child, Color? backgroundColor,double height=0.89, AlignmentGeometry alignment=Alignment.topCenter}) async {
    try{
      return await Get.dialog(Dialog(
          elevation: 0,
          alignment: alignment,
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: backgroundColor,
          child: SizedBox(
              width: Get.width,
              height: Get.height * height,
              child: Material(
                  color: backgroundColor,
                  child: Column(
                  children: [
                    Align(alignment: Alignment.topRight, child: IconButton(onPressed: ()=> Get.back(result: true), icon: const Icon(Icons.close_outlined, color: Colors.black,size: 32))),
                    Expanded(child: child)
                  ]).paddingAll(10)))),
          barrierDismissible: true,
          useSafeArea: true);
    }catch(e){
      return true;
    }
  }
}
