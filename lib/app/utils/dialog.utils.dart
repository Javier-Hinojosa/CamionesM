import 'package:camionesm/app/widgets/card_reduce.widget.dart';
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

  static Future<bool> screen({required List<Widget> children}) async {
    try{
      return await Get.dialog(Dialog(
          elevation: 0,
          alignment: Alignment.topCenter,
          insetPadding: const EdgeInsets.all(0),
          child: SizedBox(
              width: double.infinity,
              height: Get.height * 0.89,
              child: Material(child: Column(
                  children: [
                    Align(alignment: Alignment.topRight, child: IconButton(onPressed: ()=> Get.back(result: true), icon: const Icon(Icons.close_outlined, color: Colors.black,size: 32))),
                    Expanded(child: Scrollbar(child: SingleChildScrollView(child: Column(children: children))))
                  ]).paddingAll(10)))),
          barrierDismissible: true,
          useSafeArea: true);
    }catch(e){
      return true;
    }
  }
}
