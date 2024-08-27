import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<bool> dialog({required Widget child, List<TextButton>? options,AlignmentGeometry? align,void onClose}) async {
    try{
      return await Get.dialog(AlertDialog(
        alignment: align,
          title: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                onTap: () => Get.back(result: true),
                child: const Icon(Icons.close_outlined,size: 28, color: Colors.black))),
        content: SizedBox(width: Get.width, child: child),
        actions: options,insetPadding: const EdgeInsets.all(15)));
    }catch(e){
      onClose;
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

class CustomDialogs {

 static Future<bool> dialogDeleteItem(BuildContext context) {
    var errorColor=Theme.of(context).colorScheme.error;
    return DialogUtils.dialog(
        child: ListView(shrinkWrap: true, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: errorColor, // Color del borde (rojo)
                        width: 3.0)),
                child: CircleAvatar(
                    radius: 50,
                    backgroundColor: errorColor.withOpacity(0.2),
                    child: Image.asset(Paths.trash).paddingAll(20)),
              )),
          SizedBox(height: Get.height*0.02),
          Align(
              alignment: Alignment.center,
              child: CustomText("¿Estás seguro?", style: titleLarge)),
          SizedBox(height: Get.height*0.02),
          Align(
              alignment: Alignment.center,
              child: CustomText("¿De verdad quieres eliminar este registro? Este proceso no se puede deshacer.",textAlign: TextAlign.center , style: bodyMedium,maxLines: 4).paddingOnly(right: 20,left: 20)),
          SizedBox(height: Get.height*0.1),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: Get.width*0.35,
                    child: CustomButton(title: "Cancelar",
                        backgroundColor: Theme.of(context).disabledColor.withOpacity(0.05),
                        onPressed: ()=>Get.back(result: false))),
                SizedBox(width: Get.width*0.01),
                SizedBox(
                    width: Get.width*0.35,
                    child: CustomButton(title: "Eliminar",
                        backgroundColor: errorColor,
                        onPressed: ()=> Get.back(result: true)
                        ))
              ]),
          SizedBox(height: Get.height*0.05),
        ]));
  }

}
